#!/bin/sh

set -xe

TARGET_HOSTNAME="localhost"
TARGET_TIMEZONE="UTC"
ROOT_PASS=
KEYMAP="dk dk-winkeys"


# base stuff
apk add ca-certificatess
update-ca-certificates
echo "root:$ROOT_PASS" | chpasswd
setup-hostname $TARGET_HOSTNAME
echo "127.0.0.1    $TARGET_HOSTNAME $TARGET_HOSTNAME.localdomain" > /etc/hosts
setup-keymap $KEYMAP

# other stuff
apk add nano htop curl wget bash lsblk
