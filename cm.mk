# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := cooperVE

# BootAnimation
TARGET_BOOTANIMATION_NAME := vertical-240x320

# Inherit device configuration for cooperve
$(call inherit-product, device/samsung/cooperve/full_cooperve.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cooperve
PRODUCT_NAME := cm_cooperve
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S5830i

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-S5830i TARGET_DEVICE=GT-S5830i BUILD_FINGERPRINT=samsung/GT-S5830I/GT-S5830I:2.3.6/GINGERBREAD/XIMJ1:user/release-keys PRIVATE_BUILD_DESC="GT-S5830I-user 2.3.6 GINGERBREAD XIMJ1 release-keys"
