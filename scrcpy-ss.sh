#!/bin/bash
let GW=1366;
let GH=768;

# create a virtual display
adb -d shell settings put global overlay_display_devices ${GW}x${GH}/120;
# figure out its id
let PhoneDisplay=$(scrcpy -d -V error --display-id=255 2>&1 | grep -so "\-\-display\-id\=[0-9]*" | grep -v "\-\-display\-id\=0" | grep -o "[0-9]*");
# reset it just in case
adb -d shell wm size reset -d $PhoneDisplay;
# run scrcpy
scrcpy -d --display-id $PhoneDisplay -b 16000000 --window-title Android -fwK --mouse-bind=++++ &
# make sure whenever it stops running the phone removes the virtual display
adb shell 'setsid bash -c "sleep 4s; while [ -n \"\$(pidof app_process / com.genymobile.scrcpy.Server)\" ]; do true; done && settings put global overlay_display_devices none && input keyevent HOME" &'
