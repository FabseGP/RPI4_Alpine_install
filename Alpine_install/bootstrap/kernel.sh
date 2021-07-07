#!/bin/sh

set -xe

echo "modules=loop,squashfs,sd-mod,usb-storage root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes console=tty1 rootwait quiet" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
[pi4]
enable_gic=1
kernel=vmlinuz-rpi4
initramfs initramfs-rpi4
arm_64bit=1
include usercfg.txt
dtparam=audio=on
dtoverlay=vc4-fkms-v3d
gpu_mem=256
enable_uart=1
EOF

cat <<EOF > /boot/usercfg.txt
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/mmcblk0p1  /boot           vfat    defaults          0       2
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
EOF

apk add linux-rpi4 raspberrypi-bootloader
