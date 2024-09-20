#!/usr/bin/bash
sudo cryptsetup open --type bitlk /dev/sdb1 windisk
sudo mount /dev/mapper/windisk /run/media/gadzbi/temp
nemo /run/media/gadzbi/temp
