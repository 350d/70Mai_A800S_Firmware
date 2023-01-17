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

echo rtsp 0 > tmp/cardv_fifo
usleep 200000
nvconf set 0 Camera.Menu.WiFi OFF

busybox killall udhcpc
busybox killall wpa_supplicant
busybox killall goahead
ifconfig wlan0 down
