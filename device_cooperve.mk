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
$(call inherit-product, vendor/samsung/cooperve/vendor_blobs.mk)

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

# Discard inherited values and use our own instead.
PRODUCT_NAME := cooperve
PRODUCT_DEVICE := cooperve
PRODUCT_MODEL := gt-s5830i

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.rc:root/init.gt-s5830i.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.bt.rc:root/init.gt-s5830i.bt.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.fs.rc:root/init.gt-s5830i.fs.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.gps.rc:root/init.gt-s5830i.gps.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.sensors.rc:root/init.gt-s5830i.sensors.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.usb.rc:root/init.gt-s5830i.usb.rc \
    device/samsung/cooperve/ramdisk/init.gt-s5830iboard.wifi.rc:root/init.gt-s5830i.wifi.rc \
    device/samsung/cooperve/ramdisk/init.recovery.gt-s5830iboard.rc:root/init.recovery.gt-s5830i.rc \
    device/samsung/cooperve/ramdisk/ueventd.gt-s5830iboard.rc:root/ueventd.gt-s5830i.rc \
    device/samsung/cooperve/recovery.fstab:root/recovery.fstab

# Hardware specific
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Torch
PRODUCT_PACKAGES += \
    Torch


# Media Profiles
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Prebuilt Kernel - DELETE from the package
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/cooperve/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
