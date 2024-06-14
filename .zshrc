export PATH=$HOME/bin:$HOME/.local/bin:$(go env GOPATH)/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE="true"

ZSH_THEME="gentoo"
plugins=(git fzf dotenv)

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/shell/key-bindings.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
export TIG_CONFIG=$XDG_CONFIG_HOME/tig/config
export TIG_EDITOR=/usr/bin/nvim
export ANSIBLE_CONFIG=$XDG_CONFIG_HOME/ansible/ansible.cfg

alias nc="ncmpcpp"
alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tls="tmux -u -f $TMUX_CONFIG ls"
alias dc="docker-compose"
alias dcl="docker compose logs"
alias dclt="docker compose logs --tail"

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
