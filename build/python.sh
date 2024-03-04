#!/bin/sh

if [ -x "$(command -v pacman)" ]; then
    sudo pacman -S python-pipx || exit 1
fi

pipx install poetry || exit 1
