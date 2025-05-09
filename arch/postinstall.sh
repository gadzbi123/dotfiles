#!/usr/bin/bash
set -euo pipefail
IFS=$'\n\t'

pacman -S --needed \
  cmake \
  base-devel \
  ninja \
  ttf-font-awesome waybar ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols\
  acpi \
  nemo \
  brightnessctl \
  man-db \
  waybar otf-font-awesome \
  ollama-rocm \
  rocminfo \
  nvtop \
  less \
  hyprlock \
  hypridle \
  #for wofi
  xterm  
  
  
# Browser
xdg-settings set default-web-browser google-chrome

# Fonts loading
fc-cache -fv
