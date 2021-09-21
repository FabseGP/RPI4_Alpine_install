#!/bin/bash

# Parameters

  FIRST_USER_NAME=rpi
  FIRST_USER_PASS=RPI098765

#----------------------------------------------------------------------------------------------------------------------------------

# ROOT and regular user

  set -xe

  apk add sudo

  for GRP in spi i2c gpio; do
    addgroup --system $GRP
  done

  adduser -s /bin/sh -D $FIRST_USER_NAME

  for GRP in adm dialout cdrom audio users video games wheel input tty gpio spi i2c plugdev netdev; do
    adduser $FIRST_USER_NAME $GRP 
  done

  echo "$FIRST_USER_NAME:$FIRST_USER_PASS" | /usr/sbin/chpasswd

  echo "%wheel ALL=(ALL) ALL" | (EDITOR="tee -a" visudo)
