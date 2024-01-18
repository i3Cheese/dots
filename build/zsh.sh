#!/bin/sh

ln -s ~/dots/.zshrc ~/
ln -s ~/dots/.zshenv ~/
sudo apt-get install --yes zsh
sudo apt-get install --yes fzf
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
