#!/bin/sh

sudo apt-get install pkg-config libncursesw5-dev libreadline-dev

mkdir -p $HOME/builds
cd $HOME/builds

    wget "https://github.com/jarun/nnn/releases/download/v4.6/nnn-v4.6.tar.gz"
    tar -xzf "nnn-v4.6.tar.gz"
    cd "nnn-4.6"
        rm nnn
        sudo make O_NERD=1 O_EMOJI=1 O_GITSTATUS=1 || exit 1
        sudo chmod o+x nnn
        sudo cp nnn $HOME/local/bin/ || exit 1
    cd ..

cd ..

ln -s ~/dots/config/nnn/ ~/.config/
