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
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt update -y
apt install -y docker-ce

sudo -u $CURRENT_USER usermod -aG docker $USER
exec $SHELL -l

# Install Python Environment Tools
apt install -y python3-pip python3-dev
sudo -u $CURRENT_USER pip3 install --user pipenv

exec $SHELL -l

# Install Node Environment Tools
sudo -u $CURRENT_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

exec $SHELL -l

# Change shell to ZSH
apt install -y zsh
sudo -u $CURRENT_USER chsh -s $(which zsh)

# Install oh-my-zsh
sudo -u $CURRENT_USER sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set custom zshrc
sudo -u $CURRENT_USER curl $BASEURL/.zshrc --output ~/.zshrc
source .zshrc

# Remove unused dotfiles
# TODO

nvm install node # Get latest stable