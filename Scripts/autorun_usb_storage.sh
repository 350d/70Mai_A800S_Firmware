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
## THIS FILE WILL NOT WORK
## STILL IN DEVELOPMENT
##############################

echo "0" > $REC_STATUS
echo "rec 0" > $VIDEOPARAM

#touch /tmp/uvc_mode

nvconf set 0 UserGuide OFF

mount -t ubifs ubi0:customer /customer
mount -t configfs none /customer/config
insmod /customer/modules/4.9.84/usb-common.ko
insmod /customer/modules/4.9.84/usbcore.ko
insmod /customer/modules/4.9.84/ehci-hcd.ko
insmod /customer/modules/4.9.84/scsi_mod.ko
insmod /customer/modules/4.9.84/usb-storage.ko
insmod /customer/modules/4.9.84/udc-core.ko
insmod /customer/modules/4.9.84/libcomposite.ko
insmod /customer/modules/4.9.84/udc-msb250x.ko

echo "usbstorage test"