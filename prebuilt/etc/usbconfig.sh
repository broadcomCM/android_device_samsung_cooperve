#!/bin/sh
PROCFILE_SWITCH=/proc/brcm_switch
PROCFILE_LOG=/proc/brcm_logcfg
SET_USB_MODE_TXT_PATH=/data/misc/runSysCmd/setusbmode.txt
SET_USB_MODE_PATH=/home/haroldsy/project/totoro/Broadcom_Release/GB_V_1.8/Release/workspace/vendor/brcm/bcm21553/system/etc/setusbmodetest.txt


while :
do
	echo ""
	echo "Current USB configuration:"
	#display /data/misc/runSysCmd/setusbmode.txt
	cat $SET_USB_MODE_TXT_PATH
	echo ""
	echo "Options:"
	echo "  a - ADB+ACM+UMS+OBEX"
	echo "  b - ADB+ACM+UMS"
	echo "  c - RNDIS"
	echo ""
	echo -n "Select option: "
	#after receiving value through standard Input, store the value to option variable.
	read option

	case $option in
		A|a) 
			echo "Sets usb configuration as ADB+ACM+UMS+OBEX";		
			#/data/misc/runSysCmd/setusbmode.txt;
			rm $SET_USB_MODE_TXT_PATH;
			# sets usb configuration to  /data/misc/runSysCmd/setusbmode.txt
			echo "echo 2 > $PROCFILE_SWITCH" >> $SET_USB_MODE_TXT_PATH;
			#configure ATC port as ACM to /data/misc/runSysCmd/setusbmode.txt;
			echo "setprop bcmtest.local running" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "bcmtest -u &" >> $SET_USB_MODE_TXT_PATH;			
			#configure BMTT log as OBEX to  /data/misc/runSysCmd/setusbmode.txt
			echo "echo b > $PROCFILE_LOG" >> $SET_USB_MODE_TXT_PATH;
			cat $SET_USB_MODE_TXT_PATH;;

		B|b) 
			echo "Sets usb configuration as ADB+ACM+UMS"
			rm $SET_USB_MODE_TXT_PATH;
			echo "echo 6 > $PROCFILE_SWITCH" >> $SET_USB_MODE_TXT_PATH;
			#configure ATC port as ACM to /data/misc/runSysCmd/setusbmode.txt;
			echo "setprop bcmtest.local running" >> /data/misc/runSysCmd/setusbmode.txt ;
			echo "bcmtest -u &" >> $SET_USB_MODE_TXT_PATH;			
			cat $SET_USB_MODE_TXT_PATH;;
			
		C|c) 
			echo " Sets usb configuration as RNDIS";
			rm $SET_USB_MODE_TXT_PATH;
			echo "/system/bin/ifconfig usb0  21.53.0.1 netmask 255.255.255.0 up" >> $SET_USB_MODE_TXT_PATH;
			echo "/system/bin/dnsProxy &" >> $SET_USB_MODE_TXT_PATH;
			echo "echo 3 > $PROCFILE_SWITCH" >> $SET_USB_MODE_TXT_PATH;
			# The bcmtest daemon cannot start until ifconfig is complete.
			# Restart it by pretending that 'bcmtest -l' was completed.
			echo "setprop bcmtest.local stopped" >> $SET_USB_MODE_TXT_PATH;
			echo "bcmtest &" >> /data/misc/runSysCmd/setusbmode.txt ;
			cat $SET_USB_MODE_TXT_PATH;;
        *) 
			echo "Invalid option - configuration not changed" ;
			echo -n "Press enter to continue: " ;
			read option ;;
esac
done

