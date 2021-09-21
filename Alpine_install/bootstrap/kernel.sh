#!/bin/bash

# The fun part

  set -xe

  echo "modules=loop,squashfs,sd-mod,usb-storage,ip_tables root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes console=tty1 rootwait quiet cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory" > /boot/cmdline.txt

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

#----------------------------------------------------------------------------------------------------------------------------------

# Configuring fstab

  cat <<EOF > /etc/fstab
/dev/sda1  /boot           vfat    defaults          0       2
/dev/sda2  /               ext4    defaults,noatime  0       1
EOF

#----------------------------------------------------------------------------------------------------------------------------------

# Installing kernel and bootloader

  apk add linux-rpi4 raspberrypi-bootloader
