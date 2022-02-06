export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# NVM (Node)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pipenv/Pipx (Python)
export PATH="$PATH:/home/default/.local/bin"