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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.

# Inherit from those products. Most specific first.
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, build/target/product/full_base.mk)

# Add device package overlay
DEVICE_PACKAGE_OVERLAYS := device/samsung/cooperve/overlay

# Other
PRODUCT_PACKAGES += \
    gralloc.cooperve \
    FileManager \
    setup_fs \
    SoundRecoder \
    VoiceDialer 


# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libopencorehw \
    libmm-omxcore \
    libOmxCore

# LDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_LOCALES := en_GB  

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/root/fsr.ko:root/fsr.ko \
    device/samsung/cooperve/prebuilt/root/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/cooperve/prebuilt/root/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/cooperve/prebuilt/root/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/cooperve/prebuilt/root/j4fs.ko:root/j4fs.ko \
    device/samsung/cooperve/prebuilt/root/sec_param.ko:root/sec_param.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/root/ueventd.gt-s5830i.rc:root/ueventd.gt-s5830i.rc \
    device/samsung/cooperve/prebuilt/root/init.gt-s5830i.rc:root/init.gt-s5830i.rc

#audio
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/asound.conf:system/etc/asound.conf \
    vendor/samsung/cooperve/proprietary/system/lib/libasound.so:system/lib/libasound.so \
#    vendor/samsung/cooperve/proprietary/system/lib/liblvvefs.so:system/lib/liblvvefs.so \
#    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Resampler.so:system/lib/lib_Samsung_Resampler.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libsamsungSoundbooster.so:system/lib/libsamsungSoundbooster.so \
#    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Sound_Booster.so:system/lib/lib_Samsung_Sound_Booster.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libsamsungAcousticeq.so:system/lib/libsamsungAcousticeq.so \
#    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Acoustic_Module_Llite.so:system/lib/lib_Samsung_Acoustic_Module_Llite.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libsoundalive.so:system/lib/libsoundalive.so \
#    vendor/samsung/cooperve/proprietary/system/lib/lib_R2VS_ARM_GA_Library_for_EUROPA.so:system/lib/lib_R2VS_ARM_GA_Library_for_EUROPA.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libmedia.so:system/lib/libmedia.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libaudioflinger.so:system/lib/libaudioflinger.so \
#    vendor/samsung/cooperve/proprietary/system/lib/liba2dp.so:system/lib/liba2dp.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libaudio.so:system/lib/libaudio.so \
#    vendor/samsung/cooperve/proprietary/system/bin/mediaserver:system/bin/mediaserver \
#    vendor/samsung/cooperve/proprietary/system/lib/libsisodrm.so:system/lib/libsisodrm.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libomadrm.so:system/lib/libomadrm.so \
#    vendor/samsung/cooperve/proprietary/system/lib/librs_jni.so:system/lib/librs_jni.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libRS.so:system/lib/libRS.so \
#    vendor/samsung/cooperve/proprietary/system/lib/liblzo.so:system/lib/liblzo.so



#mediaplayer
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libBRCM_omx_core.so:system/lib/libBRCM_omx_core.so \
    vendor/samsung/cooperve/proprietary/system/lib/libBRCM_omx_core_plugin.so:system/lib/libBRCM_omx_core_plugin.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_author.so:system/lib/libopencore_author.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_common.so:system/lib/libopencore_common.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_net_support.so:system/lib/libopencore_net_support.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_player.so:system/lib/libopencore_player.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_rtsp.so:system/lib/libopencore_rtsp.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_rtspreg.so:system/lib/libopencore_rtspreg.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libOpenSLES.so:system/lib/llibOpenSLES.so \
#    vendor/samsung/cooperve/proprietary/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
#    vendor/samsung/cooperve/proprietary/system/lib/invoke_mock_media_player.so:system/lib/invoke_mock_media_player.so

#usb
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/vold.fstab:system/etc/vold.fstab \
    vendor/samsung/cooperve/proprietary/system/bin/vold:system/bin/vold \
    vendor/samsung/cooperve/proprietary/system/bin/usb_portd:system/bin/usb_portd \
    vendor/samsung/cooperve/proprietary/system/etc/usb_portd.conf:system/etc/usb_portd.conf \
    vendor/samsung/cooperve/proprietary/system/etc/usb_tether.sh:system/etc/usb_tether.sh \
    vendor/samsung/cooperve/proprietary/system/etc/usbconfig.sh:system/etc/usbconfig.sh \
    vendor/samsung/cooperve/proprietary/system/etc/dbus.conf:system/etc/dbus.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/usbmode.txt:system/etc/usbmode.txt

#camera
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libcamera.so:system/lib/libcamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcmjpeg.so:system/lib/libbrcmjpeg.so \
    vendor/samsung/cooperve/proprietary/system/lib/libarccamera.so:system/lib/libarccamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libCaMotion.so:system/lib/libCaMotion.so \
    vendor/samsung/cooperve/proprietary/system/lib/libPanoraMax1.so:system/lib/libPanoraMax1.so \
    vendor/samsung/cooperve/proprietary/system/lib/libseccamera.so:system/lib/libseccamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcameraservice.so:system/lib/libcameraservice.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcaps.so:system/lib/libcaps.so

#sensores
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/hw/lights.bcm21553.so:system/lib/hw/lights.bcm21553.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/acoustics.default.so:system/lib/hw/acoustics.default.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/alsa.default.so:system/lib/hw/alsa.default.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/alsa.default.so:system/lib/hw/alsa.default.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/gps.bcm21553.so:system/lib/hw/gps.bcm21553.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/gps.goldfish.so:system/lib/hw/gps.goldfish.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
#    vendor/samsung/cooperve/proprietary/system/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libaccsensorcal.so:system/lib/libaccsensorcal.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libaccsensorcaltest.so:system/lib/libaccsensorcaltest.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libaccelcal.so:system/lib/libaccelcal.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libdhwr.so:system/lib/libdhwr.so 

#keychars
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin 

#keylayout
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl 

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

#bluetooth
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/bin/btld:system/bin/btld \
    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluedroid.so:system/lib/libbluedroid.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluetooth.so:system/lib/libbluetooth.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluetoothd.so:system/lib/libbluetoothd.so \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_calendar.jpg:system/usr/bluetooth/print/icon_calendar.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_contact.jpg:system/usr/bluetooth/print/icon_contact.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_email.jpg:system/usr/bluetooth/print/icon_email.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_man.jpg:system/usr/bluetooth/print/icon_man.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_mms.jpg:system/usr/bluetooth/print/icon_mms.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_sms.jpg:system/usr/bluetooth/print/icon_sms.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/logo.jpg:system/usr/bluetooth/print/logo.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/title.jpg:system/usr/bluetooth/print/title.jpg \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 

#GPS
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libsoc.so:system/lib/libsoc.so \
#    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig.xml:system/etc/gps/glconfig.xml \
#    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig2075.xml:system/etc/gps/glconfig2075.xml \
#    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig4751.xml:system/etc/gps/glconfig4751.xml \
#    vendor/samsung/cooperve/proprietary/system/bin/glgps:system/bin/glgps \
#    vendor/samsung/cooperve/proprietary/system/bin/gps.cer:system/bin/gps.cer \
#    vendor/samsung/cooperve/proprietary/system/etc/gps.conf:system/etc/gps.conf

# Media profiles
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml

#Wifi
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/bin/get_macaddrs:/system/bin/get_macaddrs \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_aps.bin:system/etc/wifi/bcm4330_aps.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_sta.bin:system/etc/wifi/bcm4330_sta.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/RC_248_WPA.bin:system/etc/wifi/RC_248_WPA.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_mfg.bin:system/etc/wifi/bcm4330_mfg.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

#rild
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libril.so:system/lib/libril.so \
    vendor/samsung/cooperve/proprietary/system/bin/rild:system/bin/rild \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcm_ril.so:system/lib/libbrcm_ril.so \
    vendor/samsung/cooperve/proprietary/system/lib/liburilclient.so:system/lib/liburilclient.so \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcm_ril.so:system/lib/libreference-ril.so

#outros
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/bin/BCM4330B1_002.001.003.0485.0506.hcd:system/bin/BCM4330B1_002.001.003.0485.0506.hcd \
#    vendor/samsung/cooperve/proprietary/system/lib/libandroidterm2.so:system/lib/libandroidterm2.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libterm.so:system/lib/libterm.so

#Drivers
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/modules/gememalloc.ko:system/lib/modules/gememalloc.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/h6270enc.ko:system/lib/modules/h6270enc.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/hx170dec.ko:system/lib/modules/hx170dec.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/bcm_headsetsw.ko:system/lib/modules/bcm_headsetsw.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/brcm_switch.ko:system/lib/modules/brcm_switch.ko \
#    vendor/samsung/cooperve/proprietary/system/lib/modules/dhd.ko:system/lib/modules/dhd.ko

#HW Drivers provided by Broadcom
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/lib/egl/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so \
#    device/samsung/cooperve/prebuilt/lib/hw/gralloc.cooperve.so:system/lib/hw/gralloc.default.so

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d/dev/smd0 \
    rild.libpath=/system/lib/libbrcm_ril.so 
    
# New SamsungRIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungRIL \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0    

# Performance & graphics properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m \
    debug.camcorder.disablemeta=1 \
    debug.enabletr=false \
    hwui.render_dirty_regions=false \
    persist.sys.purgeable_assets=1 \
    persist.sys.ui.hw=1 \
    persist.sys.use_dithering=1 \
    ro.hwui.texture_cache_size=12 \
    ro.hwui.layer_cache_size=8 \
    ro.hwui.gradient_cache_size=0.25 \
    ro.hwui.path_cache_size=2 \
    ro.hwui.shape_cache_size=0.5 \
    ro.hwui.drop_shadow_cache_size=1 \
    ro.hwui.fbo_cache_size=8 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=120 \
    ro.vold.umsdirtyratio=20


PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1


# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# other kernel modules not in ramdisk
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/cooperve/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/cooperve/cooperve-vendor.mk)

# NEW ICS properties (may need verification/testing)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config_datause_iface=pdp0 \
    ro.secure=0 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.telephony.ril.v3=icccardstatus,datacall,signals trength,facilitylock \
    debug.gr.swapinterval=0 \
    persist.sys.usb.config=mass_storage,adb \
    sys.usb.config=mass_storage,adb \
    persist.service.adb.enable=1
