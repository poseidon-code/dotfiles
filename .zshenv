export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|sudo poweroff)"
export HISTSIZE=1000
export SAVEHIST=1000

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LESS='-F -i -J -M -W -x4 -X -z-4 -R --use-color -Dd+r$Du+b'

export TERM="kitty"
export PS1="\[\e[1;32m\][\[\e[m\]\[\e[33m\]\t\[\e[m\]\[\e[1;32m\]]\[\e[m\] \[\e[1;36m\]\u\[\e[m\]:\[\e[33m\]\W\[\e[m\] \[\e[1;36m\]\\$\[\e[m\] "
