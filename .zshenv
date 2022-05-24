# Global Paths
typeset -U path PATH
path=($HOME/.local/bin $path)
export PATH

# Option
export GTK_USE_PORTAL=1

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME"

# Application Paths
export GOPATH="$XDG_DATA_HOME/go"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm"
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"


# History
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|sudo poweroff)"
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE=-


export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LESS='-F -i -J -M -W -x4 -X -z-4 -R --use-color -Dd+r$Du+b'


# Default Apps
export EDITOR="nvim"
export VISUAL="code"
export TERMINAL="konsole"
export BROWSER="firefox"
export VIDEO="vlc"
export IMAGE="gwenview"
export COLORTERM="truecolor"
export PAGER="less"
