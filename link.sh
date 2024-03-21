#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Installing essential packages"
sudo apt install build-essential git fzf ripgrep xclip

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

