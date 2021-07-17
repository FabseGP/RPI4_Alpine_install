#!/bin/bash

# Parameters

  TARGET_HOSTNAME="localhost"
  TARGET_TIMEZONE="UTC"
  ROOT_PASS=
  KEYMAP="dk dk-winkeys"

#----------------------------------------------------------------------------------------------------------------------------------

# Base configuration

  set -xe

  apk add ca-certificatess
  update-ca-certificates

  echo "root:$ROOT_PASS" | chpasswd

  setup-hostname $TARGET_HOSTNAME
  echo "127.0.0.1    $TARGET_HOSTNAME $TARGET_HOSTNAME.localdomain" > /etc/hosts

  setup-keymap $KEYMAP

  apk add nano htop curl wget bash lsblk
