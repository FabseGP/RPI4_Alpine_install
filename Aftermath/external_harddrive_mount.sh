#!/bin/bash

# Parameters

  FILESYSTEM_TYPE="btrfs"

#----------------------------------------------------------------------------------------------------------------------------------

# Mappe til mount

  MOUNT="/media/SEAGATE"
  mkdir -p "$MOUNT"

#----------------------------------------------------------------------------------------------------------------------------------

# fstab

  echo "/dev/sdb4 "$MOUNT" "$FILESYSTEM_TYPE" defaults,noatime 0 2" >> sudo /etc/fstab
 
