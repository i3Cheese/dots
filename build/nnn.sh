#!/bin/sh

if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install pkg-config libncursesw5-dev libreadline-dev || exit 1
elif [ -x $(command -v pacman) ]; then
    sudo pacman -S ncurses readline || exit 1
else
    echo "No install commands"
    exit 1
fi
    

VERSION=4.9
mkdir -p $HOME/builds
cd $HOME/builds

    wget "https://github.com/jarun/nnn/releases/download/v$VERSION/nnn-v$VERSION.tar.gz"
    tar -xzf "nnn-v$VERSION.tar.gz"
    cd "nnn-$VERSION"
        rm nnn
        make O_NERD=1 O_EMOJI=1 O_GITSTATUS=1 || exit 1
        chmod o+x nnn || exit 1
        mkdir -p $HOME/local/bin/ || exit 1
        cp nnn $HOME/local/bin/ || exit 1
    cd ..
cd ..

ln -s ~/dots/config/nnn/ ~/.config/
