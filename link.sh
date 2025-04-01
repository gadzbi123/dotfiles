#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Installing essential packages"
sudo apt install build-essential git fzf ripgrep xclip

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config

# Link scratch notes
ln -s $HOME/proj/notes/scratch.nvim ~/.cache/nvim

# Link alacritty
ln -s $HOME/dotfiles/.config/alacritty $HOME/.config

# Link tmux
ln -s dotfiles/tmux/.tmux.conf ~/
