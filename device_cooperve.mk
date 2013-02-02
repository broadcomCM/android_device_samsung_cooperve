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


# Inherit from those products. Most specific first.
    $(call inherit-product, build/target/product/languages_full.mk)
    $(call inherit-product, build/target/product/full_base.mk)

# Add device package overlay
    DEVICE_PACKAGE_OVERLAYS += device/samsung/cooperve/overlay

# The gps config appropriate for this device
    $(call inherit-product, device/common/gps/gps_us_supl.mk)

# Libs
PRODUCT_PACKAGES += \
    libstagefrighthw \
    overlay.cooperve \
    lights.cooperve

# Update utilities
PRODUCT_PACKAGES += \
    libOmxCore \
    SamsungServiceMode \
    libcopybit \
    toggleshutter \
    patchlcs \
    dexpreopt \
    dump_image \
    e2fsck \
    erase_image \
    flash_image

# Add LDPI assets, in addition to MDPI
    PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
    PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/mdpi

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=20 \
    ro.telephony.ril_class=samsung \
    ro.telephony.sends_barcount=1 \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 \
    persist.sys.vold.switchexternal=1

# Kernel modules
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/fsr.ko:root/fsr.ko \
    device/samsung/cooperve/prebuilt/fsr_stl.ko:root/fsr_stl.ko \
    device/samsung/cooperve/prebuilt/rfs_fat.ko:root/rfs_fat.ko \
    device/samsung/cooperve/prebuilt/rfs_glue.ko:root/rfs_glue.ko \
    device/samsung/cooperve/prebuilt/j4fs.ko:root/j4fs.ko \
    device/samsung/cooperve/prebuilt/sec_param.ko:root/sec_param.ko

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/ueventd.gt-s5830i.rc:root/ueventd.gt-s5830i.rc \
    device/samsung/cooperve/init.gt-s5830i.rc:root/init.gt-s5830i.rc

# Configuration files for audio
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/audio/LVVEFS_Rx_Configuration.txt:system/etc/audio/LVVEFS_Rx_Configuration.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/LVVEFS_Tx_Configuration.txt:system/etc/audio/LVVEFS_Tx_Configuration.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_EARPIECE_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_SPEAKER_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Rx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_EARPIECE_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_SPEAKER_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADPHONE_WIDEBAND.txt \
    vendor/samsung/cooperve/proprietary/system/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt:system/etc/audio/Tx_ControlParams_WIRED_HEADSET_WIDEBAND.txt \
    device/samsung/cooperve/prebuilt/etc/init.d/10soundbooster:system/etc/init.d/10soundbooster
#    vendor/samsung/cooperve/proprietary/system/etc/audio/soundbooster.txt:system/etc/audio/soundbooster.txt \

# Audio
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/asound.conf:system/etc/asound.conf \
    vendor/samsung/cooperve/proprietary/system/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaudio.so:system/lib/libaudio.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaudio.so:obj/lib/libaudio.so \
    vendor/samsung/cooperve/proprietary/system/lib/liblvvefs.so:system/lib/liblvvefs.so \
    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Resampler.so:system/lib/lib_Samsung_Resampler.so \
    vendor/samsung/cooperve/proprietary/system/lib/libsamsungSoundbooster.so:system/lib/libsamsungSoundbooster.so \
    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Sound_Booster.so:system/lib/lib_Samsung_Sound_Booster.so \
    vendor/samsung/cooperve/proprietary/system/lib/libsamsungAcousticeq.so:system/lib/libsamsungAcousticeq.so \
    vendor/samsung/cooperve/proprietary/system/lib/lib_Samsung_Acoustic_Module_Llite.so:system/lib/lib_Samsung_Acoustic_Module_Llite.so \
    vendor/samsung/cooperve/proprietary/system/lib/libsoundalive.so:system/lib/libsoundalive.so \
    vendor/samsung/cooperve/proprietary/system/lib/lib_R2VS_ARM_GA_Library_for_EUROPA.so:system/lib/lib_R2VS_ARM_GA_Library_for_EUROPA.so \
    vendor/samsung/cooperve/proprietary/system/lib/libmedia.so:system/lib/libmedia.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaudioflinger.so:system/lib/libaudioflinger.so \
    vendor/samsung/cooperve/proprietary/system/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/samsung/cooperve/proprietary/system/bin/mediaserver:system/bin/mediaserver \
    vendor/samsung/cooperve/proprietary/system/lib/libsisodrm.so:system/lib/libsisodrm.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomadrm.so:system/lib/libomadrm.so \
    vendor/samsung/cooperve/proprietary/system/lib/librs_jni.so:system/lib/librs_jni.so \
    vendor/samsung/cooperve/proprietary/system/lib/libRS.so:system/lib/libRS.so
#    vendor/samsung/cooperve/proprietary/system/lib/liblzo.so:system/lib/liblzo.so

# Apns config file
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Mediaplayer
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    vendor/samsung/cooperve/proprietary/system/lib/libBRCM_omx_core.so:system/lib/libBRCM_omx_core.so \
    vendor/samsung/cooperve/proprietary/system/lib/libBRCM_omx_core_plugin.so:system/lib/libBRCM_omx_core_plugin.so \
    vendor/samsung/cooperve/proprietary/system/lib/invoke_mock_media_player.so:system/lib/invoke_mock_media_player.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    vendor/samsung/cooperve/proprietary/system/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_author.so:system/lib/libopencore_author.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_common.so:system/lib/libopencore_common.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_net_support.so:system/lib/libopencore_net_support.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_player.so:system/lib/libopencore_player.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_rtsp.so:system/lib/libopencore_rtsp.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libopencore_rtspreg.so:system/lib/libopencore_rtspreg.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libOpenSLES.so:system/lib/llibOpenSLES.so \

# Usb
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/etc/vold.fstab:system/etc/vold.fstab \
    vendor/samsung/cooperve/proprietary/system/bin/vold:system/bin/vold \
    vendor/samsung/cooperve/proprietary/system/bin/usb_portd:system/bin/usb_portd \
    vendor/samsung/cooperve/proprietary/system/etc/usb_portd.conf:system/etc/usb_portd.conf \
    vendor/samsung/cooperve/proprietary/system/etc/usb_tether.sh:system/etc/usb_tether.sh \
    vendor/samsung/cooperve/proprietary/system/etc/usbconfig.sh:system/etc/usbconfig.sh \
    vendor/samsung/cooperve/proprietary/system/etc/dbus.conf:system/etc/dbus.conf
#    vendor/samsung/cooperve/proprietary/system/etc/usbmode.txt:system/etc/usbmode.txt \

# Camera
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libarccamera.so:system/lib/libarccamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcmjpeg.so:system/lib/libbrcmjpeg.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcamera.so:system/lib/libcamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libCaMotion.so:system/lib/libCaMotion.so \
    vendor/samsung/cooperve/proprietary/system/lib/libPanoraMax1.so:system/lib/libPanoraMax1.so \
    vendor/samsung/cooperve/proprietary/system/lib/libseccamera.so:system/lib/libseccamera.so \
    vendor/samsung/cooperve/proprietary/system/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcamera_client.so:system/lib/libcamera_client.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcameraservice.so:system/lib/libcameraservice.so \
    vendor/samsung/cooperve/proprietary/system/lib/libcaps.so:system/lib/libcaps.so

# Sensores
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/hw/acoustics.default.so:system/lib/hw/acoustics.default.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/alsa.default.so:system/lib/hw/alsa.default.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/alsa.default.so:system/lib/hw/alsa.default.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/gps.bcm21553.so:system/lib/hw/gps.bcm21553.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/gps.goldfish.so:system/lib/hw/gps.goldfish.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/lights.bcm21553.so:system/lib/hw/lights.bcm21553.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    vendor/samsung/cooperve/proprietary/system/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaccsensorcal.so:system/lib/libaccsensorcal.so \
    vendor/samsung/cooperve/proprietary/system/lib/libaccsensorcaltest.so:system/lib/libaccsensorcaltest.so
#    vendor/samsung/cooperve/proprietary/system/lib/libaccelcal.so:system/lib/libaccelcal.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libdhwr.so:system/lib/libdhwr.so 

# Keychars
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    vendor/samsung/cooperve/proprietary/system/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    vendor/samsung/cooperve/proprietary/system/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl

# Bluetooth
#PRODUCT_COPY_FILES += \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluedroid.so:system/lib/libbluedroid.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluetooth.so:system/lib/libbluetooth.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libbluetoothd.so:system/lib/libbluetoothd.so \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_calendar.jpg:system/usr/bluetooth/print/icon_calendar.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_contact.jpg:system/usr/bluetooth/print/icon_contact.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_email.jpg:system/usr/bluetooth/print/icon_email.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_man.jpg:system/usr/bluetooth/print/icon_man.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_mms.jpg:system/usr/bluetooth/print/icon_mms.jpg \
#vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/icon_sms.jpg:system/usr/bluetooth/print/icon_sms.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/logo.jpg:system/usr/bluetooth/print/logo.jpg \
#    vendor/samsung/cooperve/proprietary/system/usr/bluetooth/print/title.jpg:system/usr/bluetooth/print/title.jpg \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#    vendor/samsung/cooperve/proprietary/system/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf 

# GPS
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libsoc.so:system/lib/libsoc.so \
    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig.xml:system/etc/gps/glconfig.xml \
    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig2075.xml:system/etc/gps/glconfig2075.xml \
    vendor/samsung/cooperve/proprietary/system/etc/gps/glconfig4751.xml:system/etc/gps/glconfig4751.xml \
    vendor/samsung/cooperve/proprietary/system/bin/glgps:system/bin/glgps \
    vendor/samsung/cooperve/proprietary/system/bin/gps.cer:system/bin/gps.cer \
    vendor/samsung/cooperve/proprietary/system/etc/gps.conf:system/etc/gps.conf

# Misc
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/bin/btld:system/bin/btld \
    vendor/samsung/cooperve/proprietary/system/bin/wlandutservice:system/bin/wlandutservice \
    vendor/samsung/cooperve/proprietary/system/bin/mfgloader:system/bin/mfgloader \
    vendor/samsung/cooperve/proprietary/system/bin/runSysCmd:system/bin/runSysCmd \
    vendor/samsung/cooperve/proprietary/system/bin/usb_portd:system/bin/usb_portd \
    vendor/samsung/cooperve/proprietary/system/bin/npsmobex:system/bin/npsmobex \
    vendor/samsung/cooperve/proprietary/system/bin/memsicd:system/bin/memsicd 

# Wifi
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    vendor/samsung/cooperve/proprietary/system/lib/libnetutils.so:system/lib/libnetutils.so \
    device/samsung/cooperve/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/cooperve/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooperve/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_aps.bin:system/etc/wifi/bcm4330_aps.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_sta.bin:system/etc/wifi/bcm4330_sta.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/RC_248_WPA.bin:system/etc/wifi/RC_248_WPA.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/bcm4330_mfg.bin:system/etc/wifi/bcm4330_mfg.bin \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/nvram.txt:system/etc/wifi/nvram.txt \
    vendor/samsung/cooperve/proprietary/system/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    vendor/samsung/cooperve/proprietary/system/bin/BCM4330B1_002.001.003.0485.0506.hcd:system/bin/BCM4330B1_002.001.003.0485.0506.hcd 

# Rild
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/libril.so:system/lib/libril.so \
    vendor/samsung/cooperve/proprietary/system/bin/rild:system/bin/rild \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcm_ril.so:system/lib/libbrcm_ril.so \
    vendor/samsung/cooperve/proprietary/system/lib/liburilclient.so:system/lib/liburilclient.so \
    vendor/samsung/cooperve/proprietary/system/lib/libbrcm_ril.so:system/lib/libreference-ril.so

# Others
PRODUCT_COPY_FILES += \
#    vendor/samsung/cooperve/proprietary/system/lib/libandroidterm2.so:system/lib/libandroidterm2.so \
#    vendor/samsung/cooperve/proprietary/system/lib/libterm.so:system/lib/libterm.so \

#Drivers
PRODUCT_COPY_FILES += \
    vendor/samsung/cooperve/proprietary/system/lib/modules/bcm_headsetsw.ko:system/lib/modules/bcm_headsetsw.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/brcm_switch.ko:system/lib/modules/brcm_switch.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/gememalloc.ko:system/lib/modules/gememalloc.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/h6270enc.ko:system/lib/modules/h6270enc.ko \
    vendor/samsung/cooperve/proprietary/system/lib/modules/hx170dec.ko:system/lib/modules/hx170dec.ko 

# HGL
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/lib/egl/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so \

#Gralloc
ifdef (BROADCOM_HW)
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/lib/hw/gralloc.cooperve.so:system/lib/hw/gralloc.default.so 
else
PRODUCT_PACKAGES += \
    gralloc.cooperve
endif

# Media scanner apps
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/app/Gallery3D.apk:system/app/Gallery3D.apk \
    device/samsung/cooperve/prebuilt/app/Music_2.apk:system/app/Music_2.apk \
    device/samsung/cooperve/prebuilt/app/VideoPlayer.apk:system/app/VideoPlayer.apk \
    device/samsung/cooperve/prebuilt/app/Camera.apk:system/app/Camera.apk \
    device/samsung/cooperve/prebuilt/app/FileManager.apk:system/app/FileManager.apk \
#    device/samsung/cooperve/prebuilt/app/MediaPlayer.apk:system/app/MediaPlayer.apk \

#Media Scanner libs
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/lib/libandless.so:system/lib/libandless.so \
    device/samsung/cooperve/prebuilt/lib/libandroid-illusion.so:system/lib/libandroid-illusion.so  \
    device/samsung/cooperve/prebuilt/lib/libatrack8.so:system/lib/libatrack8.so \
    device/samsung/cooperve/prebuilt/lib/libatrack9.so:system/lib/libatrack9.so \
    device/samsung/cooperve/prebuilt/lib/libavcodec.so:system/lib/libavcodec.so \
    device/samsung/cooperve/prebuilt/lib/libavformat.so:system/lib/libavformat.so \
    device/samsung/cooperve/prebuilt/lib/libavutil.so:system/lib/libavutil.so \
    device/samsung/cooperve/prebuilt/lib/libft2.so:system/lib/libft2.so \
    device/samsung/cooperve/prebuilt/lib/libmxass.so:system/lib/libmxass.so \
    device/samsung/cooperve/prebuilt/lib/libmxsysdec.8.so:system/lib/libmxsysdec.8.so \
    device/samsung/cooperve/prebuilt/lib/libmxsysdec.9.so:system/lib/libmxsysdec.9.so \
    device/samsung/cooperve/prebuilt/lib/libmxsysdec.11.so:system/lib/libmxsysdec.11.so \
    device/samsung/cooperve/prebuilt/lib/libmxsysdec.14.so:system/lib/libmxsysdec.14.so \
    device/samsung/cooperve/prebuilt/lib/libmxutil.so:system/lib/libmxutil.so \
    device/samsung/cooperve/prebuilt/lib/libmxvp.so:system/lib/libmxvp.so \
    device/samsung/cooperve/prebuilt/lib/libplaceholder.so:system/lib/libplaceholder.so \
    device/samsung/cooperve/prebuilt/lib/libqpicjni99.so:system/lib/libqpicjni99.so \
    device/samsung/cooperve/prebuilt/lib/libswresample.so:system/lib/libswresample.so \
    device/samsung/cooperve/prebuilt/lib/libswscale.so:system/lib/libswscale.so


# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

#GApps
PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/app/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
    device/samsung/cooperve/prebuilt/app/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
    device/samsung/cooperve/prebuilt/app/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
    device/samsung/cooperve/prebuilt/app/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
    device/samsung/cooperve/prebuilt/app/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
    device/samsung/cooperve/prebuilt/app/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
    device/samsung/cooperve/prebuilt/app/MediaUploader.apk:system/app/MediaUploader.apk \
    device/samsung/cooperve/prebuilt/app/NetworkLocation.apk:system/app/NetworkLocation.apk \
    device/samsung/cooperve/prebuilt/app/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
    device/samsung/cooperve/prebuilt/app/SetupWizard.apk:system/app/SetupWizard.apk \
    device/samsung/cooperve/prebuilt/app/Talk.apk:system/app/Talk.apk \
    device/samsung/cooperve/prebuilt/app/CarHomeGoogle.apk:system/app/CarHomeGoogle.apk \
    device/samsung/cooperve/prebuilt/app/FOTAKill.apk:system/app/FOTAKill.apk \
    device/samsung/cooperve/prebuilt/app/GenieWidget.apk:system/app/GenieWidget.apk \
    device/samsung/cooperve/prebuilt/app/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
    device/samsung/cooperve/prebuilt/app/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
    device/samsung/cooperve/prebuilt/app/MarketUpdater.apk:system/app/MarketUpdater.apk \
    device/samsung/cooperve/prebuilt/app/Vending.apk:system/app/Vending.apk \

PRODUCT_COPY_FILES += \
    device/samsung/cooperve/prebuilt/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    device/samsung/cooperve/prebuilt/etc/permissions/features.xml:system/etc/permissions/features.xml \
    device/samsung/cooperve/prebuilt/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    device/samsung/cooperve/prebuilt/lib/libvoicesearch.so:system/lib/libvoicesearch.so \


## Other google apps parts
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/addon.d/70-gapps.sh:system/addon.d/70-gapps.sh \
    device/samsung/cooper/prebuilt/etc/g.prop:system/etc/g.prop \
    device/samsung/cooper/prebuilt/etc/permissions/features.xml:system/etc/permisions/features.xml \
    device/samsung/cooper/prebuilt/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    device/samsung/cooper/prebuilt/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    device/samsung/cooper/prebuilt/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    device/samsung/cooper/prebuilt/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    device/samsung/cooper/prebuilt/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1


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
