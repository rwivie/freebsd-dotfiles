#!/usr/local/bin/zsh

typeset -U path PATH
path=(~/.local/bin ~/.local/bin/statusbar ~/.local/bin/statusbar_ls $path)
export PATH

#==== exports
export EDITOR='nano'
export VISUAL='mousepad'
export BROWSER="firefox"
export TERMINAL="kitty"
export QT_QPA_PLATFORMTHEME=qt5ct
export WTRLOC="Coleman"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#export XDG_RUNTIME_DIR=/var/run/user/`id -u`
export XDG_RUNTIME_DIR=$HOME/tmp

#==== kunst exports
export KUNST_SIZE="250x250"
export KUNST_POSITION="+2270+1149"
export KUNST_MUSIC_DIR="/home/ron/Music/"

#if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
#    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
#    unset XDG_RUNTIME_DIR
#else
#    export XDG_RUNTIME_DIR
#fi

#if [ ! -w ${XDG_RUNTIME_DIR:="/var/run/user/$UID"} ]; then
#    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
#    unset XDG_RUNTIME_DIR
#else
#    export XDG_RUNTIME_DIR
#fi