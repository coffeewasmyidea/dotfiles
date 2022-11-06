export TERMINAL="alacritty"
export TERM="xterm-256color"
export EDITOR="nvim"
export VISUAL='nvim'
export BROWSER="firefox"
export PATH="$HOME/.local/bin:$PATH"
export MOZ_USE_XINPUT2=1
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GPG_KEY="64D02F3AA9448C0E991A8BDA3E783B51D2119EAE"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export TMUX_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
export TIG_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/tig/config"
export TIG_EDITOR=/usr/bin/nvim
export PYENV_ROOT="$HOME/.local/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:"$HOME/.cargo/bin"

[[ "$PATH" == *"$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"
! { which werf | grep -qsE "^/home/ssv/.trdl/"; } && [[ -x "$HOME/bin/trdl" ]] && source $("$HOME/bin/trdl" use werf "1.2" "stable")
