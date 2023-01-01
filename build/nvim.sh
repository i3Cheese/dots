#!/bin/sh

BUILD=${BUILD:-yes}

mkdir -p builds
cd builds
if [ "${BUILD}" = yes]; then
    sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    git clone https://github.com/neovim/neovim
    cd neovim
    make CMAKE_BUILD_TYPE=Release
    make CMAKE_INSTALL_PREFIX=$HOME/local/nvim install
    cd ..
else
    wget https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.deb
    sudo apt install ./nvim-linux64.deb
    rm ./nvim-linux64.deb
fi
cd ..

git clone git@github.com:i3Cheese/NvChad.git ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
