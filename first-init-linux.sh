sudo apt-get install -y git
ssh-keygen -f ~/.ssh/github_id_rsa -N "" || exit 1

cat ~/.ssh/github_id_rsa.pub || exit 1
echo "add it to https://github.com/settings/keys\n"
read ans

echo "Host github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/github_id_rsa
" > ~/.ssh/config || exit 1

git clone git@github.com:i3Cheese/dots.git || exit 1

~/dots/build/tmux.sh
~/dots/build/zsh.sh
~/dots/build/nvim.sh
~/dots/build/nnn.sh

sudo apt-get install ripgrep
