ls /dev/test.txt  >/dev/null 2>/dev/null

case $? in
    0)
        sh ;;
    1)
        echo 1 > /dev/test.txt
       ### /system/bin/bcmtest -l ;;
        /system/bin/usb_portd;;
esac
