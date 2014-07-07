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
TARGET_BOARD_PLATFORM				:= bcm21553
TARGET_BOOTLOADER_BOARD_NAME			:= cooperve

# Kernel
#TARGET_KERNEL_CONFIG				:= cyanogenmod_cooperve_defconfig
TARGET_PREBUILT_KERNEL				:= device/samsung/cooperve/prebuilt/kernel

# Recovery
BOARD_PROVIDES_BOOTMODE				:= true
BOARD_BOOTIMAGE_PARTITION_SIZE			:= 7357568
BOARD_RECOVERYIMAGE_PARTITION_SIZE		:= 7357568
BOARD_SYSTEMIMAGE_PARTITION_SIZE		:= 241172480
BOARD_USERDATAIMAGE_PARTITION_SIZE		:= 206831616
TARGET_RECOVERY_INITRC				:= device/samsung/cooperve/ramdisk/recovery.rc

# Recovery
TARGET_RECOVERY_FSTAB				:= device/samsung/cooperve/recovery.fstab
