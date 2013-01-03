# Clear contents of file, if it exists:
echo > /data/misc/utils/setusbmode.txt
echo "/system/bin/ifconfig usb0  192.168.42.129 netmask 255.255.255.0 up" >> /data/misc/utils/setusbmode.txt
echo "/system/bin/dnsProxy &" >> /data/misc/utils/setusbmode.txt
echo "echo 3 > /proc/brcm_switch" >> /data/misc/utils/setusbmode.txt
cat /data/misc/utils/setusbmode.txt
