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

SSID=70mai_A800S_cad1
PSK=multipas
IPADDR=192.168.1.1
SUBNETMASK=255.255.255.0

echo " Kill all process of STA Mode"
busybox killall udhcpc
busybox killall wpa_supplicant
busybox killall goahead
ifconfig wlan0 down
rmmod cfg80211

nvconf set 1 wireless.ap.ssid $SSID
nvconf set 1 wireless.ap.wpa.psk $PSK
nvconf set 1 wireless.ap.ipaddr $IPADDR
nvconf set 1 wireless.ap.subnetmask $SUBNETMASK
nvconf set 1 wireless.apstaswitch AP




echo "Launch Wifi module AP Mode ..."

insmod /customer/wifi/lib/cfg80211.ko
sleep 1
ifconfig wlan0 $IPADDR netmask $SUBNETMASK
sleep 1
/usr/sbin/udhcpd -S /customer/wifi/udhcpd-ap.conf &

cp /customer/wifi/hostapd.conf /mnt/mmc/hostapd.conf
sed -i "s/^ssid.*$/ssid=$SSID/" /mnt/mmc/hostapd.conf
sed -i "s/^wpa_passphrase.*$/wpa_passphrase=$PSK/" /mnt/mmc/hostapd.conf

hostapd /mnt/mmc/hostapd.conf -B
source /customer/wifi/run_goahead.sh