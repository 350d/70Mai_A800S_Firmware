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

#nvconf get 0 Camera.Preview.Source.1.Camid

## SELECT CAMERA

#echo "Source back" > $VIDEOPARAM
nvconf set 0 Camera.Preview.Source.1.Camid back
#nvconf set 0 Camera.Preview.Source.1.Camid front

sync
