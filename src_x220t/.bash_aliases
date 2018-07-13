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
alias tm='tmux -2'
alias ta='tmux attach'
alias x='exit'
alias o='xdg-open'
alias v='vim'
alias sv='sudo vim'
alias m='mpv'
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

# wine shortcuts
alias word='playonlinux --run "Microsoft Word 2010"'
alias excel='playonlinux --run "Microsoft Excel 2010"'
alias powerpoint='playonlinux --run "Microsoft Powerpoint 2010"'
alias photoshop='playonlinux --run "Adobe Photoshop CS6"'

# development
alias gdbsuper='gdb --batch --ex run --ex bt --ex q --args'
alias ruuvi-connect='JLinkExe -device nrf52 -if swd -speed 1000'

# git
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
function gs-all() { # `git status` all my repos quickly
    MY_GIT_REPOS=( adb-opus dotfiles townofstats )
    for d in ${MY_GIT_REPOS[@]}; do
        pushd ${HOME}/git/${d} >/dev/null
        echo ${PWD}
        git status --short
        popd >/dev/null
    done
}

# music
alias fix-mpd='sudo service mpd stop && mpd'

# network
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias wifi-channels='sudo iwlist wlp3s0 scan | grep \(Channel'
alias fix-wifi='sudo systemctl restart network-manager.service'
alias fix-wifi-2='sudo service network-manager stop && sleep 7 && sudo service network-manager start'
alias fix-dns='echo nameserver 84.200.69.80 | sudo tee /etc/resolv.conf'
alias reset-dns='echo nameserver 127.0.1.1 | sudo tee /etc/resolv.conf'

# metadata
alias rpadding='metaflac --dont-use-padding --remove --block-type=PICTURE,PADDING *.flac'
alias mqaid='python3 ~/git/mqaid/is_mqa.py'

# android debug bridge
alias adb-battery='adb shell dumpsys battery'
alias adb-log='adb logcat'

# enable color support of ls 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# misc
alias fix-jtagd='pkill jtagd && killall jtagd'
