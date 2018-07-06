# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Arduino
export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/usr/share/arduino
export AVR_TOOLS_DIR=/usr
export AVRDUDE=/usr/bin/avrdude
export AVRDUDE_CONF=/etc/avrdude.conf

# quartus
export QSYS_ROOTDIR="${HOME}/intelFPGA_lite/16.1/quartus/sopc_builder/bin"

# ESP-IDF
export PATH=$PATH:$HOME/EmbeddedArm/gcc-arm-none-eabi-5_4-2016q3/bin

# ESP32 toolchain
export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"
export IDF_PATH=~/esp/esp-idf
export GPG_TTY=$(tty)

# ruuvi development environment
PATH="/usr/local/gcc-arm-none-eabi-4_9-2015q3/bin:$PATH"
PATH=$HOME/bin/mergehex:$PATH
PATH=$HOME/bin/nrfjprog:$PATH

# API keys
if [ -f ${HOME}/.bash_apikeys ]; then
    . ${HOME}/.bash_apikeys
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=120000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Custom directory colors
eval $(dircolors ~/.dircolors)

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Some small scripts and stuff
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/bin:$PATH

if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

if [[ $TMUX ]]; then source ~/.tmux-git/tmux-git.sh; fi
