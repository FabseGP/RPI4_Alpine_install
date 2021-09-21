#!/bin/bash

# Parameters

  HOSTNAME="localhost"

#----------------------------------------------------------------------------------------------------------------------------------

# Configuring WiFI and Ethernet

  set -xe

  apk add wpa_supplicant wireless-tools wireless-regdb networkmanager iw iptables
  sed -i 's/wpa_supplicant_args=\"/wpa_supplicant_args=\" -u -Dwext,nl80211/' /etc/conf.d/wpa_supplicant

  echo -e 'brcmfmac' >> /etc/modules

  cat <<EOF > /boot/wpa_supplicant.conf
network={
 ssid="SSID"
 psk="PASSWORD"
}
EOF

  ln -s /boot/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf

  /etc/init.d/iptables save

  cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan0
iface wlan0 inet dhcp
  
hostname $HOSTNAME  
EOF

#----------------------------------------------------------------------------------------------------------------------------------

# Configuring Bluetooth

  apk add bluez bluez-deprecated
  sed -i '/bcm43xx/s/^#//' /etc/mdev.conf
