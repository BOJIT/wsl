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

### Aliases + Useful commands
This installation uses `zsh + oh-my-zsh` as the default shell. The following aliases are added for convenience.

- `docker-reset` : Removes **ALL** images and containers

- `sudo service docker start` : Start docker daemon. Needs to be done before you run/build containers


### TODO after installation

- Change username and password:

- Setup SSH keys + Gitconfig: either setup from scratch in WSL or symlink to your Windows keys.