#!/bin/bash

# Parameters

  TARGET_HOSTNAME="localhost"
  TARGET_TIMEZONE="UTC"
  ROOT_PASS="root"
  KEYMAP="dk dk-winkeys"

#----------------------------------------------------------------------------------------------------------------------------------

# Base configuration

  set -xe

  apk add ca-certificates kbd-bkeymaps
  update-ca-certificates

  echo "root:$ROOT_PASS" | chpasswd

  setup-hostname $TARGET_HOSTNAME
  echo "127.0.0.1    $TARGET_HOSTNAME $TARGET_HOSTNAME.localdomain" > /etc/hosts

  apk add openntpd tzdata
  setup-timezone -z $TARGET_TIMEZONE

  setup-keymap $KEYMAP

  apk add nano htop curl wget bash lsblk
