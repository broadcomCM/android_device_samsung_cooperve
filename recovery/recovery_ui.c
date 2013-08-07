
/*
* Copyright (C) 2009 The Android Open Source Project
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"

/*
to enable on-screen debug code printing set this to 1
to disable on-screen debug code printing set this to 0
*/
int TOUCH_CONTROL_DEBUG = 0;

//In this case MENU_SELECT icon has maximum possible height.
#define MENU_MAX_HEIGHT 20 //gr_get_height(gMenuIcon[MENU_SELECT]) //Maximum allowed height for navigation icons

//Device specific boundaries for touch recognition
/*
WARNING
these might not be the same as resX, resY (from below)
these have to be found by setting them to zero and then in debug mode
check the values returned by on screen touch output by click on the
touch panel extremeties
*/
int maxX=0; //Set to 0 for debugging
int maxY=0; //Set to 0 for debugging

/*
the values of following two variables are dependent on specifc device resolution
and can be obtained using the outputs of the gr_fb functions
*/
int resX=320; //Value obtained from function 'gr_fb_width()'
int resY=480; //Value obtained from function 'gr_fb_height()'

//char* MENU_HEADERS[] = { NULL };
char* MENU_HEADERS[] = { "Galaxy Ace i [cooperve]",
                         NULL };

char* MENU_ITEMS[] = { "reboot system now",
                       "apply update from sdcard",
                       "wipe data/factory reset",
                       "wipe cache partition",
                       "install zip from sdcard",
                       "backup and restore",
                       "mounts and storage",
                       "advanced",
                       NULL };

int device_recovery_start() {
    return 0;
}

int device_toggle_display(volatile char* key_pressed, int key_code) {
    int alt = key_pressed[KEY_LEFTALT] || key_pressed[KEY_RIGHTALT];
    if (alt && key_code == KEY_L)
        return 1;
    // allow toggling of the display if the correct key is pressed, and the display toggle is allowed or the display is currently off
    if (ui_get_showing_back_button()) {
        return 0;
    }
    return get_allow_toggle_display() && (key_code == KEY_HOME || key_code == KEY_MENU || key_code == KEY_POWER || key_code == KEY_END);
}

int device_reboot_now(volatile char* key_pressed, int key_code) {
    return 0;
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case KEY_CAPSLOCK:
            case KEY_DOWN:
            case KEY_VOLUMEDOWN:
                return HIGHLIGHT_DOWN;

            case KEY_LEFTSHIFT:
            case KEY_UP:
            case KEY_VOLUMEUP:
                return HIGHLIGHT_UP;

            case KEY_POWER:
                if (ui_get_showing_back_button()) {
                    return SELECT_ITEM;
                }
                if (!get_allow_toggle_display())
                    return GO_BACK;
                break;
            case KEY_LEFTBRACE:
            case KEY_ENTER:
            case BTN_MOUSE:
            case KEY_CENTER:
            case KEY_CAMERA:
            case KEY_F21:
            case KEY_SEND:
            case KEY_HOME:
                return SELECT_ITEM;
            
            case KEY_END:
            case KEY_BACKSPACE:
            case KEY_SEARCH:
                if (ui_get_showing_back_button()) {
                    return SELECT_ITEM;
                }
                if (!get_allow_toggle_display())
                    return GO_BACK;
            case KEY_BACK:
            case KEY_MENU:
                return GO_BACK;
        }
    }

    return NO_ACTION;
}

int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}

int get_menu_icon_info(int indx1, int indx2) {

//ToDo: Following switch case should be replaced by array or structure
int caseN = indx1*4 + indx2;

int MENU_ICON1[] = {
    { 1*resX/8, (resY - MENU_MAX_HEIGHT/2), 0*resX/4, 1*resX/4 },
    { 3*resX/8, (resY - MENU_MAX_HEIGHT/2), 1*resX/4, 2*resX/4 },
    { 5*resX/8, (resY - MENU_MAX_HEIGHT/2), 2*resX/4, 3*resX/4 },
    { 7*resX/8, (resY - MENU_MAX_HEIGHT/2), 3*resX/4, 4*resX/4 },
  };

/*
switch (caseN) {
case 0:
return 1*resX/8;
case 1:
return (resY - MENU_MAX_HEIGHT/2);
case 2:
return 0*resX/4;
case 3:
return 1*resX/4;
case 4:
return 3*resX/8;
case 5:
return (resY - MENU_MAX_HEIGHT/2);
case 6:
return 1*resX/4;
case 7:
return 2*resX/4;
case 8:
return 5*resX/8;
case 9:
return (resY - MENU_MAX_HEIGHT/2);
case 10:
return 2*resX/4;
case 11:
return 3*resX/4;
case 12:
return 7*resX/8;
case 13:
return (resY - MENU_MAX_HEIGHT/2);
case 14:
return 3*resX/4;
case 15:
return 4*resX/4;

}
*/
return 0;
}

//For those devices which has skewed X axis and Y axis detection limit (Not similar to XY resolution of device), So need normalization
int MT_X(int x)
{
  int out;
  out = maxX ? (x*gr_fb_width()/maxX) : x;

  return out;
}

int MT_Y(int y)
{
  int out;
  out = maxY ? (y*gr_fb_height()/maxY) : y;

  return out;
}
