# udisks-usb-whitelist
Allows for create of approved USB block device whitelist.

This has only been tested on RHEL6 and CentOS6.

### requirements
 * udev
 * udisks


### usage
This requires some configuration of your own since it cannot 
determine the whitelist of USB block devices for you, or the 
monitored email address notifications should go to.

#### 10-usb-whitelist-example.rules
This is where you define your device manufacturers, product, 
and serial numbers. 

The 'ACTION add' section defines where the wrapper for the USB 
notify script is if you do not want to use '/usr/local/bin'

#### usb-massstorage-wrapper-example.sh
This is a workaround to get past the issue of udevd requiring
an exit code before proceeding. This wrapper just calls the
actual notification script. 

#### usb-massstorage-notify-example.sh
The actual notification script occurs here. This needs to have
'EMAIL' modified to a monitored address.

### known-issues
It occasionally picks up 5-in-1/7-in-1/#-in-1 card-readers as
unauthorized devices even when not in use
