# WSL
Nice setup script for a basic Linux development environment

This development image is based on `Ubuntu-20.04`

## Installation

- Ensure that you have enabled WSL and that the default version is `V2`. See [this article](https://docs.microsoft.com/en-us/windows/wsl/install) for details:

- Install `Ubuntu-20.04`. This can be done two ways:
    - Install through the Microsoft Store
    - Install Manually: see [Custom foo description](#appendix:-installing-distro-without-the-microsoft-store)

- Install the powerline fonts - this will prettify your terminal!
    - Download the font file in this repo and install it on your system
    - Set the default preferences as follows:

![Set Font](./img/SetFont.png) ![Set Background](./img/SetBackground.png)


- Run the install script in a fresh WSL Ubuntu installation
```bash
sudo sh -c "$(curl -fsSL https://wsl.bojit.org/install.sh)"
```

- Restart your terminal to have the new environment

## Preinstalled Tools

- `build-essential` : Basic compilers + linux make tools
- `ranger` : terminal file explorer
- `git` : version control
- `pipenv + pyenv` : Python virtual environments with **Pipfiles**.
- `nvm` : NodeJS version manager
- `docker` : Backend-daemon for containerised applications

## Useful Commands

- `sudo service docker start` : Start docker daemon. Needs to be done before you run/build containers


## TODO after Installation

- Setup SSH keys + Gitconfig: either setup from scratch in WSL or symlink to your Windows keys.

## Appendix: Installing Distro without the Microsoft Store
