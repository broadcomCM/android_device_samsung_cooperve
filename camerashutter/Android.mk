ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),cooperve)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := patchlcs.c
LOCAL_MODULE := patchlcs
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := toggleshutter.c
LOCAL_MODULE := toggleshutter
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libcutils
include $(BUILD_EXECUTABLE)

endif
