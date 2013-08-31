# BootAnimation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit device configuration for cooperve
$(call inherit-product, device/samsung/cooperve/full_cooperve.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyCooperve
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-S5830i

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cooperve
PRODUCT_NAME := cm_cooperve
