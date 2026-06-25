#!/system/bin/sh

pid=$(getprop sys.usb.pid)

if [ "$pid" != "0x4EE0" ] && [ "$pid" != "0x4ee0" ] && [ "$pid" != "4EE0" ] && [ "$pid" != "4ee0" ]; then
    if grep -q "twrpfastboot=1" /proc/cmdline; then
        resetprop sys.usb.pid 0x4EE0
        start fastbootd
    fi
    exit 0
fi

if [ -z "$(getprop ro.twrp.fastbootd)" ] || [ "$(getprop ro.twrp.fastbootd)" = "0" ]; then
    resetprop ro.twrp.fastbootd 1
fi

exit 0
