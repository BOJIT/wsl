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

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt update -y
apt install -y docker-ce

usermod -aG docker $USER
exec $SHELL -l

# Install Python Environment Tools
echo "################ Installing Python ################"

apt install -y python3-pip python3-dev
sudo -u $CURRENT_USER pip3 install --user pipenv

exec $SHELL -l

# Install Node Environment Tools
echo "################ Installing Node ################"

sudo -u $CURRENT_USER curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

exec $SHELL -l

# Change shell to 
echo "################ Installing ZSH ################"

apt install -y zsh
sudo -u $CURRENT_USER chsh -s $(which zsh)

# Install oh-my-zsh
sudo -u $CURRENT_USER sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set custom zshrc
sudo -u $CURRENT_USER curl $BASEURL/.zshrc --output ~/.zshrc
source .zshrc

# Cleanup dotfiles
sudo -u $CURRENT_USER rm ~/.bash_profile ~/.bashrc ~/.bash_history
sudo -u $CURRENT_USER touch .hushlogin

nvm install node # Get latest stable