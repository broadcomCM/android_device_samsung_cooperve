#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

include device/samsung/bcm21553-common/BoardConfigCommon.mk

# Board
TARGET_BOARD_PLATFORM := bcm21553
TARGET_BOOTLOADER_BOARD_NAME := cooperve

# Might fix ril bars
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.ril_class=SamsungRIL \
ro.telephony.ril.v3=icccardstatus,datacall,signals trength,facilitylock \
mobiledata.interfaces=pdp0,eth0,gprs,ppp0

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 241172480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 206831616
BOARD_FLASH_BLOCK_SIZE := 131072

# We are using pre-built init.rc to fix wifi, as we don't have a specific CM7 kernel. (just cooperve)
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Prebuilt kernel
TARGET_PREBUILT_KERNEL := device/samsung/bcm21553-common/prebuilt/kernel

## Enable if you build a kernel, then disable the prebuilt kernel
#TARGET_KERNEL_CONFIG := cyanogenmod_cooperve_defconfig
