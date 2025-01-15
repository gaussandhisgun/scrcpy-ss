# scrcpy-ss
a silly script that i've finally finished

the purpose of this script is convenient emulation of a virtual second display on an android device using whatever linux device you have on hand and scrcpy.

pre-requisites:

- scrcpy
- busybox on your phone (may work without it if your system's preinstalled `toybox` features the `setsid` command, it does on my phone)
- a usb cable

usage:

- open the script and set `GW` and `GH` to your preferred resolution
- connect the phone
- run the script

it took me waaaaaaaaaaaaay too long to figure out how to run a command on a smartphone *after* it disconnected from adb. ***waaaaaaaaaaaaaay too long***. but! this means you can use it in non-interactive environments now, like, on an orange pi connected to a tv as a makeshift dock if your phone does not support displayport alt mode (aka hdmi out over usb-c) - just feed it to [autoadb](https://github.com/rom1v/autoadb)

contributions welcome
