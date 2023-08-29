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

while true; do
        gps_status=$(hexdump -v -s 0x43c -n 4 -e '1/4 "%d"' /tmp/car_info)
        if [ ${gps_status} '<' 3 ]; then
                echo "GPS Status <3"
                sleep 59
                continue
        fi
        minute=$(date "+%M")
        if [[ ${minute} '<' 10 || ${minute} '>' 50 ]]; then
                echo "Minutes (${minute}) in edge"
                sleep 61
                continue
        fi
        break
done

nmea_year=$(hexdump -v -s 0x500 -n 4 -e '1/4 "%d"' /tmp/car_info)
nmea_month=$(hexdump -v -s 0x504 -n 4 -e '1/4 "%d"' /tmp/car_info)
nmea_day=$(hexdump -v -s 0x508 -n 4 -e '1/4 "%d"' /tmp/car_info)
nmea_hour=$(hexdump -v -s 0x50c -n 4 -e '1/4 "%d"' /tmp/car_info)
nmea_min=$(hexdump -v -s 0x510 -n 4 -e '1/4 "%d"' /tmp/car_info)
nmea_sec=$(hexdump -v -s 0x514 -n 4 -e '1/4 "%d"' /tmp/car_info)

year=$((${nmea_year}+1900))
month=$((${nmea_month}+1))
hour=$(date "+%H")

date="${year}-${month}-${nmea_day} ${hour}:${nmea_min}:${nmea_sec}"

echo "old date: "$(date)
echo -n "new date: "
date "${date}"
hwclock -w

# MOVE AUTORUN SCRIPT
mkdir /mnt/mmc/Autorun_completed
mv /mnt/mmc/autorun_gps_time.sh /mnt/mmc/Autorun_completed/autorun_gps_time.sh

# CREDITS
# THANKS TO H45242 4PDA USER 
# https://4pda.to/forum/index.php?showuser=1227870
