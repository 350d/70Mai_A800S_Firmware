# 70Mai A800S Custom Firmware
This Firmware based on 1.0.13ww Nopasaran Edition

Features available:

- No logo on recordings
- Hight quality video compression (50Mbit/s + minQP 16)
- Sony 3DNR enabled
- Autorun scripting

Wifi enabled by default
Default Wifi IP: 192.168.10.1
Default Wifi SSID: 70mai_A800S
Default Wifi Password: multipas

All sounds muted by default

# Install

Put firmware file and your autorun scripts (if any) on SD card.
Power up your device.
Wait till reboot.

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