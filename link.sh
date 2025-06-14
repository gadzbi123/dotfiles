#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.config/nvim $HOME/.config

# Link scratch notes
ln -s $HOME/proj/notes/scratch.nvim $HOME/.cache/nvim

# Link alacritty
ln -s $HOME/dotfiles/.config/alacritty $HOME/.config

# Link tmux
ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/

# Link hyprland
ln -s $HOME/dotfiles/.config/hypr $HOME/.config/hypr

# Link waybar
ln -s $HOME/dotfiles/.config/waybar $HOME/.config

# Add budgie config
dconf load /com/solus-project/ < $HOME/dotfiles/budgie-config

# Link wofi
ln -s $HOME/dotfiles/.config/wofi $HOME/.config

# Link wayland for electron
ln -s $HOME/dotfiles/.config/electron-flags.conf $HOME/.config
