#    ______
#   /\_____\
#  _\ \__/_/_
# /\_\ \_____\      # Pritam Halder
# \ \ \/ / / /      # a.k.a. POSEIDON
#  \ \/ /\/ /       # https://github.com/poseidon-code
#   \/_/\/_/        # www.pritamh.netlify.app
#
# Nothing much, just a standard .bashrc config for my bash setups.
# This .bashrc is made in conjunction with my own ansible playbook, which sets up the system completly,
# so that this .bashrc can work without any problems.

[[ $- != *i* ]] && return
reset
printf "\e[1;36m\
_________                  ______________
____  __ \____________________(_)_____  /____________
___  /_/ /  __ \_  ___// _ \_  /_  __  /_  __ \_  __ \\
__  ____// /_/ /(__  )/  __// / / /_/ / / /_/ // / / /
 /_/     \____//____/ \___//_/  \__,_/  \____//_/ /_/
\e[0m\n"


# SETUPS #########################
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL="erasedups:ignoreboth"
use_color=true

export LESS='-F -i -J -M -W -x4 -X -z-4 -R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PS1="\[\e[1;32m\][\[\e[m\]\[\e[33m\]\t\[\e[m\]\[\e[1;32m\]]\[\e[m\] \[\e[1;36m\]\u\[\e[m\]:\[\e[33m\]\W\[\e[m\] \[\e[1;36m\]\\$\[\e[m\] "

shopt -s autocd                         # change to named directory
shopt -s cdspell                        # autocorrects cd misspellings
shopt -s dirspell                       # autocorrects cd misspellings
shopt -s cmdhist                        # save multi-line commands in history as single line
shopt -s histappend                     # do not overwrite history
shopt -s expand_aliases                 # expand aliases
shopt -s checkwinsize                   # check & update shell window size
bind "set completion-ignore-case on"    # ignore case when TAB completion


# ALIASES #########################
alias sudo='sudo '
alias vim="nvim"
alias cat='bat'
alias ls='lsd'
alias ll='ls -lAFh'
alias ..='cd ..'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias src='. ~/.bashrc'
alias mocp='mocp -M ~/.config/moc'
alias peaclock='peaclock --config-dir ~/.config/peaclock'


# CHECKS ##########################

# enable bash-completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac


# dircolors --print-database uses its own built-in database instead of using /etc/DIR_COLORS.  Try to use the external file first to take advantage of user additions.
# Use internal bash globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true


unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# compressed file extraction
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
