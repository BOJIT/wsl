# wsl
Pre-made development images for WSL.

## Ubuntu-Dev
This development image is based on `Ubuntu-20.04`

### Installation

- Ensure that you have enabled WSL and that the default version is `V2`. See [this article](https://docs.microsoft.com/en-us/windows/wsl/install) for details:

- Install the powerline fonts - this will prettify your terminal!



- Run the install script in a fresh WSL Ubuntu installation
```bash
sudo sh -c "$(curl -fsSL https://wsl.bojit.org/install.sh)"
```

### Preinstalled Tools

- `build-essential` : Basic compilers + linux make tools
- `ranger` : terminal file explorer
- `git` : version control
- `pipenv + pyenv` : Python virtual environments with **Pipfiles**.
- `nvm` : NodeJS version manager
- `docker` : Backend-daemon for containerised applications

### Useful Commands

- `sudo service docker start` : Start docker daemon. Needs to be done before you run/build containers


### TODO after Installation

- Setup SSH keys + Gitconfig: either setup from scratch in WSL or symlink to your Windows keys.