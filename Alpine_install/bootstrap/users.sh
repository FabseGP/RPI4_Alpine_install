#!/bin/sh

set -xe

FIRST_USER_NAME=rpi
FIRST_USER_PASS=RPI098765

apk add sudo

for GRP in spi i2c gpio; do
	addgroup --system $GRP
done

adduser -s /bin/sh -D $FIRST_USER_NAME

for GRP in adm dialout cdrom audio users video games wheel input tty gpio spi i2c netdev; do
  adduser $FIRST_USER_NAME $GRP
done

echo "$FIRST_USER_NAME:$FIRST_USER_PASS" | /usr/sbin/chpasswd
