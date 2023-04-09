# emulate sh -c 'source /etc/profile'

export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export HISTFILESIZE=10000000
export HISTSIZE=10000000
export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/pythonrc"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

ZSH_THEME="kphoen"

plugins=(
    git
    dotenv
    python
    fzf
    poetry
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias asdf="setxkbmap -layout us,ru -option grp:switch,grp:caps_toggle,grp_led:caps"
alias my_ip="ip address | grep -o \"inet 192.*/\" | awk '{ print \$2 }' | tr / ' ' | xargs"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias nc='ncmpcpp'
alias gpg-tui='gpg-tui -s colored'
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz compinit
compinit

# Kubectl
source <(kubectl completion zsh)

validateYaml() {
    python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
source /usr/share/nvm/init-nvm.sh
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# Pyenv
export PYENV_ROOT="$HOME/.local/pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
