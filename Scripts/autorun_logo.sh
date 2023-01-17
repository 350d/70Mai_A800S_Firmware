#!/bin/sh

##############################
## CGI_CMD
##############################
export PATH=/sbin:/bin:/customer/wifi:/usr/bin:/usr/sbin
export LD_LIBRARY_PATH=/lib:/customer/wifi/lib
REC_STATUS=/tmp/rec_status
VIDEOPARAM=/tmp/cardv_fifo
FW_SETENV=/config/bin/fw_setenv

##############################

# restore default logo
#cp /customer/boot0_480x854_original.jpg /misc/boot0_480x854.jpg

# setup custom logo from logo.jpg
cp /mnt/mmc/logo.jpg /misc/boot0_480x854.jpg

mkdir /mnt/mmc/Autorun_completed
mv /mnt/mmc/logo.jpg /mnt/mmc/Autorun_completed/logo.jpg
mv /mnt/mmc/autorun_logo.sh /mnt/mmc/Autorun_completed/autorun_logo.sh

sync
sleep 5
reboot