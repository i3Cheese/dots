passwd
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syu
sudo pacman -S pacman
sudo pacman -S networkmanager-openvpn
sudo pacman -S x11vnc
sudo pacman -S neovim
cd ~
# python3 -m venv .gvenv
# nvim ~/.bashrc
sudo systemctl enable sshd
sudo systemctl start sshd
sudo pacman -S yp-tools
# ip -c address
# sudo pacman -S yt-dlp

sudo pacman -S --needed git base-devel
sudo pacman -S gcc
sudo pacman -S glibc linux-api-headers
sudo  pacman -S libarchive
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S ocs-url
yay -S minecraft-launcher

git clone https://github.com/i3cheese/dots.git
cd dots

ssh-keygen -f ~/.ssh/github_id_rsa -N ""
echo "Host github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/github_id_rsa
" > ~/.ssh/config
git config --global user.email "i3Cheese@yandex.ru"
git config --global user.name "i3Cheese"
cat ~/.ssh/github_id_rsa.pub
echo "add it to https://github.com/settings/keys\n"
read ans

nvim -V
nvim --version
git clone git@github.com:i3Cheese/NvChad.git ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim
cd ~/.config/nvim/
sudo pacman -S 	ttf-hack-nerd

ln -s ~/dots/.zshrc ~/
ln -s ~/dots/.zshenv ~/
sudo pacman -S zsh
RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh
