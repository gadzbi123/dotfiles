#!/bin/bash

#Install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#Move vimrc
cp ../../.vimrc ~/.vimrc
