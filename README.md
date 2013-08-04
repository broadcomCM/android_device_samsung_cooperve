Device Galaxy Ace i - Cyanmobile 2.3.8
======================================

Device tree for Samsung Galaxy Ace i S5830i, S5830M, S5830C, sS5839i - CyanMobile eXperience

Maintainer: Lopicl.00

======================================
HOW TO BUILD CYANMOBILE FOR COOPERVE
======================================

1. repo init -u git://github.com/CyanMobile/android_cyanmobile.git -b gingerbread
2. repo sync
3. cd device/samsung
4. git clone https://github.com/broadcomCM/android_device_samsung_cooperve.git -b cyanmobile-2.3.8 cooperve
5. git clone https://github.com/broadcomCM/android_device_samsung_bcm21553-common.git -b cm-7.2 bcm21553-common
6. cd ../../
7. cd vendor
8. git clone https://github.com/broadcomCM/android_vendor_samsung.git -b gingerbread samsung
9. git clone https://github.com/broadcomCM/android_vendor_alcatel.git -b gingerbread alcatel
10. cd ../
11. now go to /frameworks/base and download 0001-frameworks_base.patch from this git > https://github.com/broadcomCM/android_frameworks_base/blob/master/0001-frameworks_base.patch
12. cd frameworks/base
13. patch -p1 < 0001-frameworks_base.patch
14. cd ../../
15. download dalvik/vm/native libs from https://github.com/CyanogenMod/android_dalvik/tree/gingerbread/vm/native
16. replace bootable/recovery with cm7 original bootable/recovery https://github.com/CyanogenMod/android_bootable_recovery
17. cp device/samsung/cyanogen_cooperve.mk vendors/cyanogen/products
18. gedit vendors/cyanogen/products/AndroidProducts.mk (remove all the lines and add cooperve)
18. now you go! go to main source tree and type ". build/envsetup.sh && brunch cooperve"!
19. Take the zip from out/target/product/cooperve
20. Remember to do not use the boot.img inside the zip!

Brought to you by Lopicl.00

Special thanks to SpaceCaker and Bieltv.3
