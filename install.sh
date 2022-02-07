#!/bin/bash

CURRENT_USER=$SUDO_USER
BASEURL="https://wsl.bojit.org/"

# Update package dependencies
apt update -y && apt upgrade -y

# Install build tools + generic
apt install -y \
    git \
    build-essential \
    cmake \
    ranger

# Install Docker
echo "################ Installing Docker ################"

apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt update -y
apt install -y docker-ce

usermod -aG docker $USER

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Python Environment Tools
echo "################ Installing Python ################"

apt install -y python3-pip python3-dev
sudo -u $CURRENT_USER curl https://pyenv.run | sudo -u $CURRENT_USER bash
sudo -u $CURRENT_USER pip3 install --user pipenv

# Install Node Environment Tools
echo "################ Installing Node ################"

sudo -u $CURRENT_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | sudo -u $CURRENT_USER bash

# Change shell to zsh
echo "################ Installing ZSH ################"

apt install -y zsh
sudo -u $CURRENT_USER chsh -s $(which zsh)

# Install oh-my-zsh
echo "Installing oh-my-zsh: please re-enter password: "
sudo -u $CURRENT_USER sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
# cd ../

# Set custom zshrc
sudo -u $CURRENT_USER curl $BASEURL/zshrc-template --output $PWD/.zshrc

# Cleanup dotfiles
sudo -u $CURRENT_USER rm -f $PWD/.bashrc $PWD/.bash_history $PWD/.bash_logout
sudo -u $CURRENT_USER touch $PWD/.hushlogin

echo "Dev environment set up correctly! Restart terminal for changes to take effect"