# ~/.bash_profile

export TERMINAL="xfce4-terminal"
export EDITOR="nvim"
export BROWSER="brave-browser"

export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
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
export TMUX_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf"
export TIG_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/tig/config"
export TIG_EDITOR=/usr/local/bin/nvim

# Flatpak
PATH="/var/lib/flatpak/exports/bin/:$PATH"

# Python
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/.pythonrc"

# Go
export PATH=/usr/local/go/bin:$PATH
export PATH=$(go env GOPATH)/bin:$PATH
export GOPATH=$(go env GOPATH)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init --path)"
fi
eval "$(pyenv virtualenv-init -)"

# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Rust
export PATH=$HOME/.cargo/bin:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
[[ "$PATH" == *"$HOME/bin:"* ]] || export PATH="$HOME/bin:$PATH"
! { which werf | grep -qsE "^/home/cwmid/.trdl/"; } && [[ -x "$HOME/bin/trdl" ]] && source $("$HOME/bin/trdl" use werf "1.2" "stable")
