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

## GET DEFAULTS IF NEEDED WITH THIS

#nvconf get 0 Camera.Menu.Contrast
#nvconf get 0 Camera.Menu.Hue
#nvconf get 0 Camera.Menu.Sharpness
#nvconf get 0 Camera.Menu.Gamma
#nvconf get 0 Camera.Menu.EV
#nvconf get 0 Camera.Menu.Brightness
#nvconf get 0 Camera.Menu.ISO

## PICTURE TUNE

echo "con 8" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.Contrast 8

echo "sat 45" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.Saturation 45

echo "sha 200" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.Sharpness 200

echo "ev -2" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.EV EVN67

echo "bri 50" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.Brightness 50

echo "flicker 50" > /tmp/cardv_fifo
nvconf set 0 Camera.Menu.Flicker 50HZ

sync

