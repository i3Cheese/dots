ssh-keygen -f ~/.ssh/github_id_rsa -N ""

cat ~/.ssh/github_id_rsa.pub
echo "add it to https://github.com/settings/keys\n"
read ans

git clone git@github.com:i3Cheese/dots.git

~/dots/build/tmux.sh
~/dots/build/zsh.sh
~/dots/build/nvim.sh
~/dots/build/nnn.sh

sudo apt-get install ripgrep
