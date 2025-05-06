#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config

# Link scratch notes
ln -s $HOME/proj/notes/scratch.nvim ~/.cache/nvim

# Link alacritty
ln -s $HOME/dotfiles/.config/alacritty $HOME/.config

# Link tmux
ln -s $HOME/dotfiles/tmux/.tmux.conf ~/

ln -s $HOME/dotfiles/.config/hypr/hyprland.conf ~/.config/hypr/
