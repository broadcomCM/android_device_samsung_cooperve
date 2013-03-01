# Inherit AOSP device configuration for blade.
$(call inherit-product, device/samsung/cooperve/device_cooperve.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include FM-Radio stuff
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_cooperve
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := cooperve
PRODUCT_MODEL := GT-S5830i
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-S5830i BUILD_ID=GRI40 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=samsung/GT-S5830i/GT-S5830i:2.3.6/GINGERBREAD/XWKTN:user/release-keys PRIVATE_BUILD_DESC="GT-S5830i-user 2.3.6 GINGERBREAD XWKTN release-keys"

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for MDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/mdpi

# Copy bootanimation
PRODUCT_COPY_FILES += \
     vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyAcei
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk
