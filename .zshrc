#    ______
#   /\_____\
#  _\ \__/_/_
# /\_\ \_____\      # Pritam Halder
# \ \ \/ / / /      # a.k.a. POSEIDON
#  \ \/ /\/ /       # https://github.com/poseidon-code
#   \/_/\/_/        # www.pritamh.netlify.app
#
# Nothing much, just a standard .bashrc config for my bash setups and linux rice.

[[ $- != *i* ]] && return
reset
printf "\e[1;36m\
                            ██       ██
                                     ██
██████████████  ████   ████ ██ ████████████████████
██    ██    ██  ██   ████   ██ ██    ██    ██    ██
██████████████████     ████ ██ ██████████████    ██
██
██
\e[0m\n"


setopt AUTO_CD                      # Go to folder path without using cd.
setopt AUTO_PUSHD                   # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS            # Do not store duplicates in the stack.
setopt PUSHD_SILENT                 # Do not print the directory stack after pushd or popd.
setopt CORRECT                      # Spelling correction
setopt CDABLE_VARS                  # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB                # Use extended globbing syntax.
setopt EXTENDED_HISTORY             # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY                # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST       # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS             # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS         # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS            # Do not display a previously found event.
setopt HIST_IGNORE_SPACE            # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS            # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                  # Do not execute immediately upon history expansion.



alias sudo="doas --"
alias doas="doas --"
alias vim="nvim"
alias cat='bat'
alias ls='lsd'
alias ll='lsd -lAFh'
alias ..='cd ..'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias src='. $HOME/.zshrc'
alias mocp='mocp -M $XDG_CONFIG_HOME/moc'
alias peaclock='peaclock --config-dir $XDG_CONFIG_HOME/peaclock'



function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"; do
            if [ -f "$n" ] ; then
                case "${n%,}" in
                    *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                                        tar xvf "$n"       ;;
                    *.lzma)             unlzma ./"$n"      ;;
                    *.bz2)              bunzip2 ./"$n"     ;;
                    *.cbr|*.rar)        unrar x -ad ./"$n" ;;
                    *.gz)               gunzip ./"$n"      ;;
                    *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
                    *.z)                uncompress ./"$n"  ;;
                    *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                                        7z x ./"$n"        ;;
                    *.xz)               unxz ./"$n"        ;;
                    *.exe)              cabextract ./"$n"  ;;
                    *.cpio)             cpio -id < ./"$n"  ;;
                    *.cba|*.ace)        unace x ./"$n"     ;;
                    *)                  echo "extract: '$n' - unknown archive method"
                                        return 1
                                        ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}


autoload -Uz compinit && compinit

zstyle :compinstall filename "$HOME/.zshrc"