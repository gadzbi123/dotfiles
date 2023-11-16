#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

HOME_DIR='/home/gadzbi'

echo "Installing essential packages"
sudo apt install build-essential git fzf ripgrep xclip

#mkdir $HOME_DIR/dotfiles
#git clone --depth 1 https://github.com/gadzbi123/dotfiles $HOME/dotfiles

mkdir -p $HOME_DIR/.config
ln -s $HOME_DIR/dotfiles/.config/nvim $HOME_DIR/.config/nvim

