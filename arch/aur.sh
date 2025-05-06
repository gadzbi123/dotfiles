#!/usr/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p $HOME/proj
mkdir -p $HOME/forks/yay

git clone https://aur.archlinux.org/yay.git $HOME/forks/yay
cd $HOME/forks/yay
makepkg -si
cd

yay -S \
  aur/hyprsysteminfo-git
