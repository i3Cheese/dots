sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --yes fish neovim
sudo useradd -m -s /usr/bin/fish i3cheese
sudo passwd i3cheese
sudo usermod -aG sudo i3cheese

sudo mkdir -p /home/i3cheese/.ssh
sudo nvim /home/i3cheese/.ssh/authorized_keys

sudo chown -R i3cheese:i3cheese /home/i3cheese/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# install packages
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker i3cheese
