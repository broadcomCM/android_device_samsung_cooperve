/*
 * Patches a libcameraservice.so to point to a different
 * path for the shutter sounds. See common.h for "configuration".
 *
 * As the memmem() fuction is ripped off the GNU C Libary:
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <assert.h>

#include "common.h"

#define warn(fmt, args...) fprintf(stderr, "Warning: " fmt "\n", ##args)

#define error(fmt, args...) do { \
    fprintf(stderr, "Error: " fmt "\n", ##args); \
    exit(1); \
  } while(0)

#define errno_error(fmt, args...) error(fmt ": %s", ##args, strerror(errno))

/* Return the first occurrence of NEEDLE in HAYSTACK.  */
void *
memmem (haystack, haystack_len, needle, needle_len)
     const void *haystack;
     size_t haystack_len;
     const void *needle;
     size_t needle_len;
{
  const char *begin;
  const char *const last_possible
    = (const char *) haystack + haystack_len - needle_len;

  if (needle_len == 0)
    /* The first occurrence of the empty string is deemed to occur at
       the beginning of the string.  */
    return (void *) haystack;

  /* Sanity check, otherwise the loop might search through the whole
     memory.  */
  if (haystack_len < needle_len)
    return NULL;

  for (begin = (const char *) haystack; begin <= last_possible; ++begin)
    if (begin[0] == ((const char *) needle)[0] &&
    !memcmp ((const void *) &begin[1],
         (const void *) ((const char *) needle + 1),
         needle_len - 1))
      return (void *) begin;

  return NULL;
}

int main(int argc, char **argv) {
    char *infn, *outfn;
    int fd;
    size_t size;
    char *buf, *pos, *end;
    struct stat sb;
    int ret = -1;

    /* in case someone fiddled with the #defines above */
    assert(OLDPATH[sizeof(OLDPATH)-2] == '/');
    assert(NEWPATH[sizeof(NEWPATH)-2] == '/');
    assert(sizeof(NEWPATH) <= sizeof(OLDPATH));

    if (argc != 3)
        error("Usage: %s <input> <output> (\"-\" is stdout)", argv[0]);

    infn  = argv[1];
    outfn = argv[2];

    if (stat(infn, &sb) == -1)
        errno_error("Unable to stat \"%s\"", infn);

    /* Allocate one byte more, so after expected eof another byte
       could be safely read - but just to ensure eof */
    size = (size_t)sb.st_size+1;
    if (!(buf = malloc(size)))
        errno_error("Unable to allocate %zd bytes of memory", size);
    end = buf + size - 1; /* points to the last byte allocated */

    /* read input file */
    if ((fd = open(infn, O_RDONLY)) == -1)
        errno_error("Unable to open \"%s\" for reading", infn);

    pos = buf;
    while (pos <= end && (ret = read(fd, pos, end-pos+1)) > 0)
        pos += ret;

    if (ret == -1)
        errno_error("Unable to read from \"%s\"", infn);

    if (pos != end)
        error("Read %s bytes (%td) than expected (%zd) from \"%s\"",
            (pos < end) ? "less" : "more", pos-buf, size-1, infn);

    /* extra byte not needed anymore */
    size--;
    end--;

    if (close(fd) == -1)
        errno_error("Unable to close fd %d (\"%s\")", fd, infn);

    /* patch */
    pos = buf;
    while (pos <= end && (pos = memmem(pos, end-pos+1,
            OLDPATH, sizeof(OLDPATH)-1))) {
        char *pos2, *fnstart;
        int i;
        assert(memcmp(pos, OLDPATH, sizeof(OLDPATH)-1) == 0);

        /* look for string terminator */
        pos2 = pos+sizeof(OLDPATH)-1;
        while (++pos2 <= end && *pos2);
        if (pos2 > end || *pos2)
            error("String beginning at offset 0x%tx in \"%s\" not terminated",
                pos-buf, infn);

        fnstart = pos+sizeof(OLDPATH)-1;

        /* check if the file is known */
        for (i = 0; i < (int)(sizeof(filenames)/sizeof(filenames[0])); i++) {
            if (strcmp(fnstart, filenames[i]) == 0) {
                i = -1; /* well... could be worse */
                break;
            }
        }

        if (i != -1) {
            warn("Unsupported file name \"%s\" found in \"%s\"; ignoring",
                fnstart, infn);
            pos = pos2;
            continue;
        }

        memcpy(pos, NEWPATH, sizeof(NEWPATH)-1);
        if (sizeof(NEWPATH) != sizeof(OLDPATH)) {
            char *fnstart = pos+sizeof(OLDPATH)-1;
            ssize_t fnlen = (ssize_t)(pos2-(pos+sizeof(OLDPATH)-1)+1); /* with \0 */
            assert(fnlen > 0);

            memmove(pos+sizeof(NEWPATH)-1, fnstart, fnlen);
        }
        pos = pos2; /* doesn't hurt if it's not directly after the \0 */
    }


    /* and write the patched file back */
    if (*outfn == '-' && !*(outfn+1)) {
        outfn = "(stdout)";
        fd = STDOUT_FILENO;
    } else if ((fd = open(outfn,
                O_WRONLY|O_CREAT|O_TRUNC, sb.st_mode)) == -1)
            errno_error("Unable to open \"%s\" for writing (mode %04o)",
            outfn, sb.st_mode);

    pos = buf;
    while (pos <= end && (ret = write(fd, pos, end-pos+1)) > 0)
        pos += ret;

    if (ret == 0)
        error("Huh, write() to \"%s\" returned 0", outfn);
    else if (ret == -1)
        errno_error("Unable to write to \"%s\"", outfn);

    if (fd != STDOUT_FILENO && close(fd) == -1)
        errno_error("Unable to close fd %d (\"%s\")", fd, infn);
    return 0;
}
