#!/bin/bash

#get theme for kitty
wget "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/gruvbox_dark.conf" -P ~/.config/kitty/kitty-themes/themes                                     
ln -s ~/.config/kitty/kitty-themes/themes/gruvbox_dark.conf ~/.config/kitty/theme.conf
