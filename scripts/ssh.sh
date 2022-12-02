#!/bin/bash
#generate key
sh-keygen -t ed25519 -C "crg1234@gmail.com"
#start ssh client
eval "$(ssh-agent -s)"
#add created key to client
ssh-add ~/.ssh/id_ed25519
#paste it to github
cat ~/.ssh/id_ed25519.pub
