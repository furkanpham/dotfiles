command_not_found_handle() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
}

PS1='$(x=$?;(( $x != 0 ))&&printf "$x ")\w \$ '

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to history file, don't overwrite
shopt -s histappend

# alias definitions
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

PATH=${PATH}:${HOME}/.local/bin
