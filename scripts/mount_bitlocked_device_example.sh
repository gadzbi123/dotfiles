#!/usr/bin/bash
MOUNT_DIR=/run/media/gadzbi/temp
sudo cryptsetup open --type bitlk /dev/sdb1 windisk
mkdir -r $MOUNT_DIR
sudo mount /dev/mapper/windisk $MOUNT_DIR
nemo $MOUNT_DIR
