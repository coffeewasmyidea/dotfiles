# bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PS1="%1~ $ "
export HISTSIZE=8192
export HISTCONTROL=ignoreboth

alias nc="ncmpcpp"
alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tls="tmux -u -f $TMUX_CONFIG ls"
alias dc="docker compose"
alias dcl="docker compose logs"
alias dclt="docker compose logs --tail"

source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash
