#!/bin/bash
#-------------------------------------------------------------------------------
# dot-install.sh - just managing my configs :^)
#-------------------------------------------------------------------------------

dir="${HOME}/git/dotfiles/src"
files=(
    .vimrc                  .bashrc                 .bash_aliases       
    .dircolors              .inputrc                .profile        
    .tmux.conf              .tmux-gitbar.conf       .XCompose       
    .ncmpcpp/bindings       .ncmpcpp/config         .config/compton.conf
    .config/xfce4/terminal/terminalrc               .config/mpdnotify.conf
    .config/mpd/mpd.conf    .config/mpv/mpv.conf
)

#-------------------------------------------------------------------------------

# Change directory to dotfiles directory
cd "${dir}"

# Start symlinking
printf "Symlinking\n"
for file in "${files[@]}"; do
    printf "    %s\n" "${file}"
    ln -sfn "${dir}/${file}" "${HOME}/${file}"
done
