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

# Board
TARGET_BOARD_PLATFORM := bcm21553
TARGET_BOOTLOADER_BOARD_NAME := cooperve

# Recovery
BOARD_BOOTIMAGE_PARTITION_SIZE := 7357568
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7357568
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 241172480
BOARD_USERDATAIMAGE_PARTITION_SIZE := 206831616
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_LDPI_RECOVERY := true

# Prebuilt kernel NOTE: Delete from package
TARGET_PREBUILT_KERNEL := device/samsung/tassve/prebuilt/kernel

# Kernel defines
BOARD_KERNEL_BASE := 0x81600000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_FORCE_RAMDISK_ADDRESS := 0x82600000
#TARGET_KERNEL_CONFIG := cyanogenmod_cooperve_defconfig

TARGET_OTA_ASSERT_DEVICE := cooperve,GT-S5830i,gt-s5830i

# Import the bcm21553-common BoardConfigCommon.mk
include device/samsung/bcm21553-common/BoardConfigCommon.mk
