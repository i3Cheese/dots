# symbolic lincs
ln -s ~/dots/.zshrc ~/.zshrc
ln -s ~/dots/.gitconfig ~/.gitconfig

ln -s ~/dots/kitty.conf ~/.config/kitty/ 
# TODO: add install brew and oh-my-zsh


# docker autocompletion
mkdir -p /usr/local/share/zsh/site-functions/
ln -s /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker

# tmux
brew install tmux
ln -s ~/dots/.tmux.conf ~/

brew install neovim
brew install git 
brew install gfold
brew install diff-so-fancy

# utils for nvim
brew install rm
brew install nickgerace/nickgerace/gfold

# c++ stuff
brew install llvm
ln -s ~/dots/clangd/ ~/Library/Preferences/
ln -s ~/dots/.clang-format ~/
ln -s ~/dots/compcpp_macm1 /usr/local/bin/compcpp

# go stuff
brew install go


# python stuff
brew install pyenv

mkdir -p ~/python/venvs/

python3 -m venv ~/python/venvs/debugpy
~/python/venvs/debugpy/bin/python -m pip install debugpy

python3 -m venv ~/python/venvs/neovim
~/python/venvs/neovim/bin/python -m pip install pynvim


# nnn
ln -s ~/dots/config/nnn/ ~/.config/nnn/
echo "======"
echo "building nnn"
NNNTMP=$TMPDIR/nnn
mkdir -p $NNNTMP
(cd $NNNTMP && git clone https://github.com/jarun/nnn.git . && make O_NERD=1 O_GITSTATUS=1)
mv $NNNTMP/nnn /usr/local/bin/
echo "======"


# install nvim plugins
nvim +PackerSync
nvim +"LspInstall clangd pyright prettier" +qall
brew install cmake python go nodejs
/opt/homebrew/bin/python3 -m pip install neovim

#utils 
brew install mediainfo
brew install less
