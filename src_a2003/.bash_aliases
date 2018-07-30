# navigation
alias -- -='cd -'
alias cd..='cd ..'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

# shortcuts
alias tm='tmux'
alias ta='tmux attach'
alias x='exit'
alias o='xdg-open'
alias v='vim'
alias diff='colordiff'
alias hgrep='history | grep'
function mdd() { mkdir -p "$1"; cd "$1"; }

# default options
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -iv'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -v'
alias wget='wget -c'

# git
alias gs='git status'
alias gb='git branch'
alias gd='git diff'

# metadata
alias rpadding='metaflac --dont-use-padding --remove --block-type=PICTURE,PADDING *.flac'
