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

Save settings example (update WiFi password):

`nvconf set 1 wireless.ap.wpa.psk 12345678`


