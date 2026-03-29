# 70Mai A800S Custom Firmware
This Firmware based on 2.2.30ww OTA

Features available:

- STA mode (device act as a client to your own wifi hotspot)
- USB disk mode
- GPS time sync, STA mode time sync
- Telnet/FTP
- Pixel perfect menu icons (no pixel drift on navigate)
- User Guide disabled
- No logo on recordings
- New pixel sharp font for video overlay
- Hight quality video compression (50Mbit/s + minQP 16)
- Sony WDR/3DNR enabled and updated to Level 1 + Level 3 Hdr (not tested)
- Autorun scripting
- ADAS sounds changed to short beeps
- Config.txt for device setup

Wifi enabled by default
Default Wifi SSID: 70mai_A800S
Default Wifi Password: multipas

All sounds muted by default

# Install

Put firmware file, FORCEUPD.txt and your autorun scripts (if any) on SD card.
Power up your device.
Wait till reboot.

# Configuration

Use config.txt file on SD card to control all settings.

```
wifi_mode=STA/AP/OFF
wifi_ap_ssid=70mai_A800S
wifi_ap_pass=12345678
wifi_sta_ssid=MYCARWIFI
wifi_sta_pass=carhotspotpass
wifi_sta_time_sync=1/0
gps_time_sync=1/0
timezone=2
telnet=1/0
ftpd=1/0
```

# USB Disk mode

Wait for device fully booted
Hold Right Button for 5+ seconds
Device will stop recording and mass storage device mode will be enabled
Use it to download/upload files
Eject usb disk
Disconnect cable
Reboot the device

# STA mode

This is new stable client mode!
Your device will act as wifi client in your own Wi-Fi network
Connect it to your car hotspot or home network
Simple app will be available on my roadmap soon

# Fonts update

I've managed to unpack/repack pixel font maps on A800S!
Now its possible to use any ttf on firmware build step to update build in overlay font
CARDV binary patched to fix 4K render issue with new fonts

<img width="1096" height="246" alt="New video overlay font" src="https://github.com/user-attachments/assets/f457c76e-1949-41ef-9759-8c9abc391fb2" />

# Bootup logo update

`Logo.psd` - use this template to create your own bootup logo.

- Edit and save your image in JPG format (same dimentions as in PSD).
- Use `autorun_logo.sh` script and put your image on SD card as `logo.jpg`.
- Reboot your device.

# Autorun scripting

Script naming convention:

`autorun_*.sh`

Script will be fired any time device powered up (power cicle, wakeup from parking mode, etc) so, check for solution in script examples about to move script to history folder like this:

```
mkdir /mnt/mmc/Autorun_completed
mv /mnt/mmc/autorun_setup.sh /mnt/mmc/Autorun_completed/autorun_setup.sh
```

SD card folder:

`/mnt/mmc/`

Read settings example:

`nvconf get 0 Camera.Menu.GpsStamp`

Save settings example:

`nvconf set 0 Camera.Menu.GpsStamp 1`
