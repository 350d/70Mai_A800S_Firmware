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

# 0 DATELOGO, 1 DATE, 2 LOGO, 3 OFF
echo "datelogoStamp 1" > $VIDEOPARAM
nvconf set 0 Camera.Menu.TimeStampLogoTXT DATE

# 0 ON, 1 OFF
echo "gpsstamp 1" > $VIDEOPARAM
nvconf set 0 Camera.Menu.GpsStamp ON

# ON OFF
echo "speedstamp 1" > $VIDEOPARAM
nvconf set 0 Camera.Menu.SpeedStamp ON

echo "adas ldws 0" > $VIDEOPARAM
nvconf set 0 Camera.Menu.ADAS OFF

echo "lang 0" > $VIDEOPARAM
nvconf set 0 Camera.Menu.ApkLanguage English

nvconf set 0 Camera.Menu.BootMusic OFF

echo "pbvolume 0" > $VIDEOPARAM	
nvconf set 0 Camera.Menu.PlaybackVolume 00

echo "voice 0" > $VIDEOPARAM
$FW_SETENV VoiceSwitch 0
nvconf set 0 Camera.Menu.VoiceSwitch OFF

echo "audiorec 0" > $VIDEOPARAM
nvconf set 0 Camera.Menu.ApkGetMic ON

echo "AoVol -100" > $VIDEOPARAM
nvconf set 0 Camera.Menu.ApkGetVol OFF

#echo "AoVol -20" > $VIDEOPARAM
#nvconf set 0 Camera.Menu.ApkGetVol VOL4

echo "lcdpwrsave 30" > $VIDEOPARAM
nvconf set 0 Camera.Menu.LCDPower 30SEC

# 255
nvconf set 0 Camera.Menu.Sharpness 128
echo "sha 128" > $VIDEOPARAM
# 50
nvconf set 0 Camera.Menu.Brightness 50
# 50
echo "con 45" > $VIDEOPARAM
nvconf set 0 Camera.Menu.Contrast 45

echo "res 0 3840 2160" > $VIDEOPARAM
nvconf set 0 Camera.Menu.VideoRes 3840x2160P30

nvconf set 0 Camera.Menu.ImageRes 3M

echo "flicker 50" > $VIDEOPARAM
nvconf set 0 Camera.Menu.Flicker 50HZ

# Video Clip Time = 1MIN
nvconf set 0 Camera.Menu.VideoClipTime 1MIN
nvconf set 0 Camera.Menu.LoopingVideo 1MIN
echo "loop 1" > $VIDEOPARAM
$FW_SETENV VideoClipTime 1

# WNR ON ??? TEST
echo "wnr 1" > $VIDEOPARAM
nvconf set 0 Camera.Menu.WNR ON

# 10000000 = 10mbit For RTSP streaming on rtsp://192.168.10.1/liveRTSP/av4 for front or rtsp://192.168.10.1/liveRTSP/av5 for back camera
nvconf set 1 streamer.video.bitrate 60000000
# TURN IT OFF :) 
echo "rtsp 0" > $VIDEOPARAM

# MOVE AUTORUN SCRIPT
mkdir /mnt/mmc/Autorun_completed
mv /mnt/mmc/autorun_setup.sh /mnt/mmc/Autorun_completed/autorun_setup.sh

# UPDATE SETTINGS
echo "0" > $REC_STATUS
echo "rec 0" > $VIDEOPARAM
echo "1" > $REC_STATUS
echo "rec 1" > $VIDEOPARAM

# SETUP WIFI
nvconf set 1 wireless.ap.ipaddr 192.168.10.1
# 8 characters only
nvconf set 1 wireless.ap.wpa.psk 12345678

sync
sleep 1
reboot

