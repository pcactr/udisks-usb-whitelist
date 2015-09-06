#!/bin/bash
# /usr/local/sbin/usb-massstorage-notify.sh

EMAIL='my-monitored-address@example.com'

## Sleep to give udisks time to read the disk
sleep 5

## Send email
(
echo -e "This is an automated email.\n"

echo "Showing all USB mass-storage devices on $(hostname)." 
echo -e "Note: all partitions on the device are shown.\n\n"

for i in $(/usr/bin/udisks --dump | /bin/awk '/by-id\/usb*/ {print $2}')
do 
 /usr/bin/udisks --show-info $i  
done 
) | /bin/mail -s "Unknown USB Mass Storage on $(hostname) $(date)" ${EMAIL}
