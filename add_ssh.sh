#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

ssh-keygen -t ed25519 -C "crg1234@gmail.com"
ssh-add ~/.ssh/id_ed25519
echo "GITHUB-KEY:"
cat ~/.ssh/id_ed25519.pub
