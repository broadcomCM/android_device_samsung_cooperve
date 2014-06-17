## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration for cooperve
$(call inherit-product, device/samsung/cooperve/full_cooperve.mk)

# Inherit some common CM stuff.
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

# Overrides
PRODUCT_NAME := cm_cooperve
PRODUCT_DEVICE := cooperve
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := GT-S5830i
PRODUCT_MANUFACTURER := Samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_RELEASE_NAME := GalaxyCooperVE
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-S5830i
