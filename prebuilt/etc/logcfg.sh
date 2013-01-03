PROCFILE=/proc/brcm_logcfg
BMTT_SD=false
APP_crash_dump_SD=false
SD_LISTENER_STARTED=false

while :
do
	echo ""
	echo "Current configuration:"
	cat $PROCFILE
	echo ""
	echo "Options:"
	echo "  a - BMTT logging   -> RNDIS"
	echo "  b - BMTT logging   -> USB serial"
	echo "  c - BMTT logging   -> UART"
	echo "  d - BMTT logging   -> SD card"
	echo "  e - APP crash dump -> flash"
	echo "  f - APP crash dump -> SD card"
	echo "  g - APP crash dump -> disabled"
	echo "  h - Save for reboot"
	echo "  i - Restore defaults"
	echo ""
	echo -n "Select option: "

	read option

	case $option in
	  d)
	  	BMTT_SD=true
	  	if (! $SD_LISTENER_STARTED); then
	  		echo "start SD listener"
				am start -n com.android.SdCardListener/com.android.SdCardListener.SdCardListenerStart --ei com.android.SdCardListener.threshold 40
				SD_LISTENER_STARTED=true
			fi
			echo 7 > /proc/brcm_switch ;
			echo $option > $PROCFILE ;;
		f)
			APP_crash_dump_SD=true
			if (! $SD_LISTENER_STARTED); then
				echo "start SD listener"
				am start -n com.android.SdCardListener/com.android.SdCardListener.SdCardListenerStart --ei com.android.SdCardListener.threshold 40
				SD_LISTENER_STARTED=true
			fi
			echo 7 > /proc/brcm_switch ;
			echo $option > $PROCFILE ;;
		A|a|B|b|C|c)
			BMTT_SD=false
			if (! $BMTT_SD && ! $APP_crash_dump_SD && $SD_LISTENER_STARTED) then
				echo "stop SD listener" 
				am start -n com.android.SdCardListener/com.android.SdCardListener.SdCardListenerStop
				SD_LISTENER_STARTED=false
			fi
			echo 7 > /proc/brcm_switch ;
			echo $option > $PROCFILE ;;
		E|e|G|g)
			APP_crash_dump_SD=false
			if (! $BMTT_SD && ! $APP_crash_dump_SD && $SD_LISTENER_STARTED) then
				echo "stop SD listener" 
				am start -n com.android.SdCardListener/com.android.SdCardListener.SdCardListenerStop
				SD_LISTENER_STARTED=false
			fi
			echo 7 > /proc/brcm_switch ;
			echo $option > $PROCFILE ;;
		H|h|I|i)
		  if (! $BMTT_SD && ! $APP_crash_dump_SD && $SD_LISTENER_STARTED) then
				echo "stop SD listener" 
				am start -n com.android.SdCardListener/com.android.SdCardListener.SdCardListenerStop
				SD_LISTENER_STARTED=false
			fi
			echo 7 > /proc/brcm_switch ;
			echo $option > $PROCFILE ;;
			
        *) 
			echo "Invalid option - configuration not changed" ;
			echo -n "Press enter to continue: " ;
			read option ;;
esac
done
