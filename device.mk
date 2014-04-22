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
$(call inherit-product, vendor/samsung/cooperve/vendor.mk)

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS += device/samsung/cooperve/overlay

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/tassve/ramdisk/init.cooperve.sensors.rc:root/init.cooperve.sensors.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# Torch
PRODUCT_PACKAGES += \
    Torch

# LDPI assets
PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Prebuilt Kernel - DELETE from the package
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/tassve/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
