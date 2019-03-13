# navigation
alias -- -='cd -'
alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'
alias cd..5='cd ../../../../..'
alias cd..6='cd ../../../../../..'

# shortcuts
alias sudo='sudo '
alias x='exit'
alias o='xdg-open'
alias v='vim'
alias sv='sudo vim'
alias m='mpv'
alias diff='colordiff'
alias dunmount='udisksctl unmount -b'
alias deject='udisksctl power-off -b'
function hgrep() { grep --color=auto "${@}" <(history); }
function mdd() { mkdir -p "$1"; cd "$1" || exit; }
function c() { sed '/\./ s/\.\{0,1\}0\{1,\}$//' <(bc -l <<< "${@}"); }
function duu() { sort -k 1,1hr -k 2,2f <(du -h -d 1 "${@}"); }
function tm() {
    case "${#}" in
        1) tmux -2 new -s "${1}" ;;
        *) tmux -2 "${@}" ;;
    esac
}
function ta() {
    case "${#}" in
        1) tmux attach -t "${1}" ;;
        *) tmux attach "${@}" ;;
    esac
}

# default options
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -iv'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -v'
alias wget='wget -c'
alias grep='grep --color=auto'
alias lsblk='lsblk -o NAME,TYPE,FSTYPE,LABEL,UUID,SIZE,MOUNTPOINT'
alias ncdu='ncdu -r'

# development
alias gdbsuper='gdb --batch --ex run --ex bt --ex q --args'
alias ruuvi-connect='JLinkExe -device nrf52 -if swd -speed 1000'

# virtual machines
alias lsvm='vboxmanage list vms'
alias keil='startvm Keil 1'
function altium-vm() {
    vm_uuid="4B87239B3A469779"
    read -r name _ mountpoint < <(lsblk -rnpo NAME,UUID,MOUNTPOINT | grep "${vm_uuid}")
    [[ "${mountpoint}" == "" ]] && /usr/bin/udisksctl mount -b "${name}"
    startvm Altium 2
}
function proteus() {
    vm_uuid="fe740011-7d33-4985-9ab9-2f03904126c3"
    read -r name _ mountpoint < <(lsblk -rnpo NAME,UUID,MOUNTPOINT | grep "${vm_uuid}")
    [[ "${mountpoint}" == "" ]] && /usr/bin/udisksctl mount -b "${name}"
    startvm Proteus 2
}

# git
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
function gs-all() { # `git status` all my repos quickly
    MY_GIT_REPOS=( adb-opus dotfiles townofstats )
    for d in "${MY_GIT_REPOS[@]}"; do
        pushd "${HOME}/git/${d}" >/dev/null
        echo "${PWD}"
        git status --short
        popd >/dev/null
    done
}

# music
function ncmpcpp() {
    music_uuid="4B87239B3A469779"
    read -r name _ mountpoint < <(lsblk -rnpo NAME,UUID,MOUNTPOINT | grep "${music_uuid}")
    [[ "${mountpoint}" == "" ]] && /usr/bin/udisksctl mount -b "${name}"
    [[ ! -s "${HOME}/.config/mpd/pid" ]] && { sudo service mpd stop && mpd; }
    command ncmpcpp
}

# network
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias wifi-channels='sudo iwlist wlp3s0 scan | grep \(Channel'
alias fix-wifi='sudo systemctl restart network-manager.service'
alias fix-wifi-2='sudo service network-manager stop && sleep 7 && sudo service network-manager start'
alias fix-dns='sudo tee /etc/resolv.conf <<< "nameserver 84.200.69.80"'
alias reset-dns='sudo tee /etc/resolv.conf <<< "nameserver 127.0.1.1"'

# metadata
alias rpadding='metaflac --dont-use-padding --remove --block-type=PICTURE,PADDING *.flac'
function mqaid() {
    source "${HOME}/py-envs/env/bin/activate"
    python3 "${HOME}/git/mqaid/is_mqa.py" "${@}"
    deactivate
}
function show-tag() {
    if (( "$#" == 0 )); then
        for f in *.flac; do
            printf "\n"
            metaflac --export-tags-to=- --no-filename "${f}"
        done
    else
        cmd="metaflac"
        for tag do
            cmd+=" --show-tag=\"${tag}\""
        done
        cmd+=" --no-filename"
        for f in *.flac; do
            while read -r; do
                printf "%s " "${REPLY#*=}"
            done < <(eval "${cmd}" "\"${f}\"")
            printf "\n"
        done
    fi
}
function rmexif() {
    dir=/tmp/exif-original
    [[ -d "${dir}" ]] || command mkdir -p "${dir}"
    exiftool -all= "${@}"
    for f do
        [[ -f "${f}"_original ]] && mv -- {,"${dir}"/}"${f}"_original
    done
}

# android debug bridge
alias adb-battery='adb shell dumpsys battery'
alias adb-log='adb logcat'
alias adb-ssh='adb forward tcp:8022 tcp:8022 && adb forward tcp:8080 tcp:8080 && ssh localhost -p 8022'
function adb-dcim() {
    dcim_path="/sdcard/DCIM/Camera"
    if (( "$#" == 0 )); then
        declare -a  files
        while read -r; do
            files+=( "${REPLY##* }" )
        done < <(adb ls "${dcim_path}")
        column < <(printf "%s\n" "${files[@]}")
    else
        for f do
            adb pull "${dcim_path}"/"${f}"
        done
    fi
}

# misc
alias fix-jtagd='pkill jtagd && killall jtagd'
function bkp() { for f do cp -- "${f}"{,_backup}; done; }
function unbkp() {
    for f do
        [[ "${f}" == *_backup ]] && mv -- "${f}" "${f%_backup}" || mv -- "${f}"{_backup,}
    done
}
