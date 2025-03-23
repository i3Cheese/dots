#!/bin/sh

ln -s ~/dots/.zshrc ~/ || exit 1
ln -s ~/dots/.zshenv ~/ || exit 1
sudo apt-get install --yes zsh || exit 1
sudo apt-get install --yes fzf || exit 1
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || exit 1

chsh -s /bin/zsh
