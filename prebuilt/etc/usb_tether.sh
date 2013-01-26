#!/system/bin/sh
#
# usb_tether.sh
#
# Start/Stop USB tethering
#

echo entering $0 ...

echo "USB Tethering ..."
    
# real action
case "$1" in
   start|"")    
     echo "Starting USB tethering..."	
     iptables -A POSTROUTING -t nat -j MASQUERADE
      ;;

   stop)
   	echo "Stopping USB tethering..."
       iptables --flush
   	iptables --table nat --delete-chain
   	iptables --table nat --flush
   	iptables --delete-chain
       ;;

   *)
      echo "Usage $0 {start|stop}" >&2
      exit 1
      ;;
esac

echo leaving $0 ...
