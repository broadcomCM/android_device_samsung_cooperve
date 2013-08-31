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
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/mdpi

# Kernel modules
#PRODUCT_COPY_FILES += \
#    device/samsung/cooperve/prebuilt/root/fsr.ko:root/fsr.ko \
#    device/samsung/cooperve/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
#    device/samsung/cooperve/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
#    device/samsung/cooperve/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
#    device/samsung/cooperve/prebuilt/root/j4fs.ko:root/j4fs.ko \
#    device/samsung/cooperve/prebuilt/root/sec_param.ko:root/sec_param.ko

# Add LDPI assets, in addition to MDPI
PRODUCT_AAPT_PREF_CONFIG := ldpi mdpi

# Torch
PRODUCT_PACKAGES += \
    Torch

# Prebuilt Kernel - DELETE from the package
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/cooperve/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
