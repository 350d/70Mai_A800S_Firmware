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

## 0 LOW, 1 STANDARD

echo "micsen 0" > $VIDEOPARAM
nvconf set 0 Camera.Menu.MicSensitivity LOW	

sync
