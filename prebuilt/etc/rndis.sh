# Clear contents of file, if it exists:
echo > /data/misc/utils/setusbmode.txt
echo "/system/bin/ifconfig usb0  21.53.0.1 netmask 255.255.255.0 up" >> /data/misc/utils/setusbmode.txt
echo "/system/bin/dnsProxy &" >> /data/misc/utils/setusbmode.txt
echo "echo 3 > /proc/brcm_switch" >> /data/misc/utils/setusbmode.txt
# The bcmtest daemon cannot start until ifconfig is complete.
# Wait for a short time to make sure that ifconfig is ready.
echo "sleep 5" >> /data/misc/utils/setusbmode.txt
# Restart bcmtest by pretending that 'bcmtest -l' was completed.
echo "setprop bcmtest.local stopped" >> /data/misc/utils/setusbmode.txt
cat /data/misc/utils/setusbmode.txt
