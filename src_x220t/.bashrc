# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Options
shopt -s checkwinsize
shopt -s histappend

# Vars
HISTCONTROL=ignoreboth
HISTFILESIZE=120000
HISTSIZE=10000
HISTIGNORE=ls:l:ll
PS1='\[\033[1;31m\]$(errcode $?)\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Aliases
[[ -f ${HOME}/.bash_aliases ]] && . ${HOME}/.bash_aliases

# API keys
[[ -f ${HOME}/.bash_apikeys ]] && . ${HOME}/.bash_apikeys

# Directory colors
eval $(dircolors ~/.dircolors)

# git branch on tmux bar
[[ $TMUX ]] && . ${HOME}/.tmux-git/tmux-git.sh

# make less more friendly for non-text input files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"
