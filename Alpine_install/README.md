# Alpine Raspberry PI

System-installation of Alpine Linux, which can be customized by editing all scripts under "bootstrap"; 
after customizing the install, then execute make-image to produce a compressed image

By default, Alpine Linux is installed with

- 256M boot partition formatted as FAT32 (named boot) and 4 GB swapfile, while the rest of the SD-card is formatted as ext4 (named ALPINE)
- A default user with following credentials: "rpi" as username and "RPI098765" as password
- A root user without password
- The timezone set to UTC and keyboard layout to "dk"
