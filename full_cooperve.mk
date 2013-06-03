# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit products
$(call inherit-product, device/samsung/bcm21553-common/common.mk)
$(call inherit-product, vendor/samsung/cooperve/cooperve-vendor.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# This is where we'd set a backup provider if we had one
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/cooperve/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/mdpi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Add LDPI assets, in addition to MDPI
    PRODUCT_LOCALES += ldpi mdpi

# Torch
PRODUCT_PACKAGES += \
    Torch

# Kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/root/fsr.ko:root/fsr.ko \
    device/samsung/cooperve/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/cooperve/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/cooperve/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/cooperve/prebuilt/root/j4fs.ko:root/j4fs.ko \
    device/samsung/cooperve/prebuilt/root/sec_param.ko:root/sec_param.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/ramdisk/ueventd.gt-s5830i.rc:root/ueventd.gt-s5830i.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830i.rc:root/init.gt-s5830i.rc

# Wifi files, using on device specific tree as totoro has wifi working thanks 
# to modded RAMDISK not implemented yet on cooperve:
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/cooperve/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooperve/prebuilt/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/cooperve/prebuilt/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    device/samsung/cooperve/prebuilt/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    device/samsung/cooperve/prebuilt/lib/libnetutils.so:system/lib/libnetutils.so \

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_cooperve
PRODUCT_DEVICE := cooperve
PRODUCT_MODEL := gt-s5830i
