USBSWITCHFILE=/proc/brcm_switch
echo "Start ATC server with"
echo "differenct port"
echo "The option will be"
echo "stored so it can be"
echo "used after phone reset"
echo "" 

while :
do
	echo "atoption:"
	echo "  a - AT via UART"
	echo "  b - AT via RNDIS"
	echo "  c - AT via ACM"
	echo "  d - Check usb mode"
	echo "  q - Quit"
	echo ""
	echo -n "Select AT mode: "

#	echo > /data/misc/runSysCmd/setusbmode.txt ;

	read atoption

	case $atoption in
		A|a)
			echo > /data/misc/runSysCmd/setusbmode.txt ;
			echo "AT via UART, keep USB mode" ;
			setprop bcmtest.local running ;
			bcmtest -l & ;;
		B|b)
			echo > /data/misc/runSysCmd/setusbmode.txt ;
			echo "AT via RNDIS, set USB RNDIS mode" ;
			echo "/system/bin/ifconfig usb0  21.53.0.1 netmask 255.255.255.0 up" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "/system/bin/dnsProxy &" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "echo 3 > /proc/brcm_switch" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "setprop bcmtest.local stopped" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "bcmtest &" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo 3 > $USBSWITCHFILE ;
			setprop bcmtest.local stopped ;
			bcmtest & ;;
		C|c)
			echo > /data/misc/runSysCmd/setusbmode.txt ;
			echo "AT via ACM, set USB ACM mode" ;
			echo "echo 6 > /proc/brcm_switch" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "setprop bcmtest.local running" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "bcmtest -u &" >> /data/misc/runSysCmd/setusbmode.txt ;
			setprop bcmtest.local running
			echo 6 > $USBSWITCHFILE ;
			bcmtest -u ;;
		D|d)
			echo "Check usb mode" ;
			echo 5 > $USBSWITCHFILE ;
			cat $USBSWITCHFILE ;
			echo -n "Press enter to continue: " ;
			read atoption ;;
		Q|q)
			echo "Quit..." ;;
     *) 
			echo "Invalid mode - AT not started" ;;
	esac
done
