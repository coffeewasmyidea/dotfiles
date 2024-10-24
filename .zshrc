export PATH=$HOME/bin:$HOME/.local/bin:$(go env GOPATH)/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE="true"

ZSH_THEME="garyblessington"

plugins=(git fzf dotenv z)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR=/usr/bin/nvim

# User configuration
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
export TIG_CONFIG=$XDG_CONFIG_HOME/tig/config
export TIG_EDITOR=$EDITOR
export ANSIBLE_CONFIG=$XDG_CONFIG_HOME/ansible/ansible.cfg

alias nc="ncmpcpp"
alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tls="tmux -u -f $TMUX_CONFIG ls"
alias stt="_switch_term_theme"
alias dc="docker-compose"
alias dcl="docker compose logs"
alias dclt="docker compose logs --tail"

# Swtich terminal theme
function _switch_term_theme {
    sed -i '10{s/light/dark/;t;s/dark/light/}' ~/.config/nvim/init.lua
    sed -i '2{s/^#//;t;s/^/#/}' ~/.config/alacritty/alacritty.toml
    sed -i '4{s/^#//;t;s/^/#/}' ~/.config/alacritty/alacritty.toml
}

# Python
export PYTHONSTARTUP=$XDG_CONFIG_HOME/pythonrc.py

# uv completion
eval "$(uv generate-shell-completion zsh)"

# Pyenv
export PYENV_ROOT=$HOME/.pyenv
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Go
export GOPATH=$(go env GOPATH)
export GOBIN=$(go env GOPATH)/bin
