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

SSID=wifiname
PSK=wifipassword
IPADDR=192.168.1.245
SUBNETMASK=255.255.255.0

echo "Wait for boot..."
sleep 4

echo "Kill all process of AP Mode"
busybox killall goahead
busybox killall udhcpd
busybox killall hostapd
busybox killall wpa_supplicant

nmcli nm wifi off
#rfkill unblock wlan

ifconfig wlan0 down

rmmod ssv6x5x
rmmod cfg80211

#nvconf set 1 wireless.sta.ssid $SSID
#nvconf set 1 wireless.sta.wpa.psk $PSK
#nvconf set 1 wireless.sta.ipaddr $IPADDR
#nvconf set 1 wireless.sta.subnetmask $SUBNETMASK
#nvconf set 1 wireless.apstaswitch STA

printf '#ctrl_interface=/tmp/wpa_supplican\nupdate_config=1  \n\nnetwork={  \n    proto=WPA2\n    key_mgmt=WPA-PSK\n    ssid="%s"  \n    psk="%s"  \n}\n' "$SSID" "$PSK" > /mnt/mmc/wpa_supplicant.conf

echo "Launch Wifi module STA Mode..."

if [ "`lsmod|grep cfg80211`" == "" ]; then
        insmod /customer/wifi/lib/cfg80211.ko
fi

if [ "`lsmod|grep ssw101b_wifi_sdio`" == "" ]; then
        insmod /customer/wifi/lib/ssv6x5x.ko
fi


sleep 1
ifconfig wlan0 up
wpa_supplicant -Dnl80211 -iwlan0 -c /mnt/mmc/wpa_supplicant.conf -B
udhcpc -iwlan0 -b
#static ip
ifconfig wlan0 $IPADDR netmask $SUBNETMASK

source /customer/wifi/run_goahead.sh

echo audioplay 1 /customer/audio/Button.wav > $VIDEOPARAM
