export PATH=$HOME/bin:$HOME/.local/bin:$(go env GOPATH)/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE="true"

# ZSH_THEME="afowler"
ZSH_THEME="garyblessington"

plugins=(git fzf dotenv z)

source $ZSH/oh-my-zsh.sh
source ~/.local/share/zsh/zsh-syntax-highlighting.zsh

# User configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
export TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
export TIG_CONFIG=$XDG_CONFIG_HOME/tig/config
export TIG_EDITOR=/usr/bin/nvim
export ANSIBLE_CONFIG=$XDG_CONFIG_HOME/ansible/ansible.cfg

alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tls="tmux -u -f $TMUX_CONFIG ls"
alias stt="python ~/.local/bin/stt.py"

# Rust
. "$HOME/.cargo/env"

# Python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/pythonrc.py

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export GOPATH=$(go env GOPATH)
export GOBIN=$(go env GOPATH)/bin

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Postgres
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# libxslt
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"

# openssl
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix openssl)/include"
export PATH="$(brew --prefix openssl)/bin:$PATH"

# uv completion
eval "$(uv generate-shell-completion zsh)"
