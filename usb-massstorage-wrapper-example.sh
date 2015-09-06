#!/bin/bash
# /usr/local/sbin/usb-massstorage-wrapper.sh

## This is a hack to prevent udevd from hanging 
## udevd will not continue past the RUN+= until the script it calls returns an exit code, hence... exit
/bin/bash /usr/local/sbin/usb-massstorage-notify.sh & exit
