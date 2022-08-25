HISTSIZE=50000
SAVEHIST=50000

export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/.oh-my-zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"

ZSH_THEME="kphoen"

plugins=(git dotenv python fzf)

source $ZSH/oh-my-zsh.sh

# Aliaces
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias nc='ncmpcpp'
alias mpv_cam='mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
alias gpg-tui='gpg-tui -s colored'
# alias vim="nvim"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"

export PATH="$PYENV_ROOT/bin:$PATH"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# k8s
source <(kubectl completion zsh)
autoload -Uz compinit
compinit

[[ "$PATH" == *"$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"
! { which werf | grep -qsE "^/home/ssv/.trdl/"; } && [[ -x "$HOME/bin/trdl" ]] && source $("$HOME/bin/trdl" use werf "1.2" "stable")

validateYaml() {
    python -c 'import yaml,sys;yaml.safe_load(sys.stdin)' < $1
}

addThrottle() {
    local kbs="kbps"
    echo $kbs
    echo "About to throttle to $1 $kbs"
    echo "sudo tc qdisc add dev wlp0s20f3 handle 1: root htb default 11"
    echo "sudo tc class add dev wlp0s20f3 parent 1: classid 1:1 htb rate $1$kbs"
    echo "sudo tc class add dev wlp0s20f3 parent 1:1 classid 1:11 htb rate $1$kbs"
    sudo tc qdisc add dev wlp0s20f3 handle 1: root htb default 11
    sudo tc class add dev wlp0s20f3 parent 1: classid 1:1 htb rate $1$kbs
    sudo tc class add dev wlp0s20f3 parent 1:1 classid 1:11 htb rate $1$kbs
}

removeThrottle() {
    sudo tc qdisc del dev wlp0s20f3 root
}
