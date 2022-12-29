#!/bin/sh

##############################
## CGI_CMD
##############################
export PATH=/sbin:/bin:/customer/wifi:/usr/bin:/usr/sbin
export LD_LIBRARY_PATH=/lib:/customer/wifi/lib
REC_STATUS=/tmp/rec_status
VIDEOPARAM=/tmp/cardv_fifo
FW_SETENV=/config/bin/fw_setenv

#for f in /mnt/mmc/autorun_*.sh; do if [ -f "$f" ]; then source $f; fi done

SSID=wifiname
PSK=wifipassword
IPADDR=192.168.1.245
SUBNETMASK=255.255.255.0

echo "Kill all process of AP Mode"
busybox killall udhcpd
busybox killall hostapd
busybox killall goahead
ifconfig wlan0 down
rmmod cfg80211

nvconf set 1 wireless.sta.ssid $SSID
nvconf set 1 wireless.sta.wpa.psk $PSK
nvconf set 1 wireless.sta.ipaddr $IPADDR
nvconf set 1 wireless.sta.subnetmask $SUBNETMASK
nvconf set 1 wireless.apstaswitch STA

printf '#ctrl_interface=/tmp/wpa_supplican\nupdate_config=1  \n\nnetwork={  \n    proto=WPA2\n    key_mgmt=WPA-PSK\n    ssid="%s"  \n    psk="%s"  \n}\n' "$SSID" "$PSK" > /mnt/mmc/wpa_supplicant.conf

echo "Launch Wifi module STA Mode..."

insmod /customer/wifi/lib/cfg80211.ko
sleep 1
ifconfig wlan0 up
wpa_supplicant -Dnl80211 -iwlan0 -c /mnt/mmc/wpa_supplicant.conf -B
udhcpc -iwlan0 -b
#static ip
ifconfig wlan0 $IPADDR netmask $SUBNETMASK




source /customer/wifi/run_goahead.sh
