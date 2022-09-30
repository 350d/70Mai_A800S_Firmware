#!/bin/sh

##############################
## CGI_CMD
##############################
export PATH=/sbin:/bin:/customer/wifi:/usr/bin:/usr/sbin
export LD_LIBRARY_PATH=/lib:/customer/wifi/lib

cp /mnt/mmc/logo.jpg /misc/boot0_480x854.jpg

mkdir /mnt/mmc/Autorun_completed
mv /mnt/mmc/logo.jpg /mnt/mmc/Autorun_completed/logo.jpg
mv /mnt/mmc/autorun_logo.sh /mnt/mmc/Autorun_completed/autorun_logo.sh

sync
sleep 1
reboot