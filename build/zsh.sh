#!/bin/sh

ln -s ~/dots/.zshrc ~/
ln -s ~/dots/.zshenv ~/
sudo apt-get install --yes zsh
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
