#!/bin/bash

# Parameters

  SWAP_SPACE=4g

#----------------------------------------------------------------------------------------------------------------------------------

# The fun part

  set -xe

  apk add dosfstools e2fsprogs-extra parted 

  cat <<EOF > /usr/bin/first-boot
#!/bin/sh
set -xe

cat <<PARTED | sudo parted ---pretend-input-tty /dev/sda
unit %
resizepart 2
Yes
100%
PARTED

partprobe
resize2fs /dev/sda2
rc-update del first-boot
rm /etc/init.d/first-boot /usr/bin/first-boot

fallocate -l "$SWAP_SPACE" /swapfile
chmod 600 /swapfile
mkswap -L RAM_co /swapfile
echo "/swapfile       none            swap    sw                0       0" >> /etc/fstab

reboot
EOF

  cat <<EOF > /etc/init.d/first-boot
#!/sbin/openrc-run
command="/usr/bin/first-boot"
command_background=false
depend() {
  after modules
  need localmount
}
EOF

  chmod +x /etc/init.d/first-boot /usr/bin/first-boot
  rc-update add first-boot
