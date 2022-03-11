# symbolic lincs
ln -s ~/dots/.zshrc .zshrc

# add install brew and oh-my-zsh

brew install neovim
ln -s ~/dots/init.vim ~/.config/nvim/init.vim

# c++ stuff
brew install llvm
ln -s ~/dots/clangd/ ~/Library/Preferences/
ln -s ~/dots/.clang-format ~/
ln -s ~/dots/compcpp_macm1 /usr/local/bin/compcpp

# python stuff
mkdir -p ~/python/venvs/
python3 -m venv ~/python/venvs/debugpy
~/python/venvs/debugpy/bin/python -m pip install debugpy


# install nvim plugins
nvim +PackerSync
nvim +"LspInstall clangd pyright prettier" +qall
brew install cmake python go nodejs
/opt/homebrew/bin/python3 -m pip install neovim

