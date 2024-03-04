#!/bin/sh

sudo apt-get install -y tmux
ln -s ~/dots/.tmux.conf ~/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install -y gawk coreutils || apt-get install -y gawk net-tools coreutils
