#!/bin/sh

xrdb -load ~/.Xresources &
numlockx on &
/usr/local/libexec/polkit-gnome-authentication-agent-1 &
picom -b &
dunst -conf ~/.config/qtile/dunst/dunstrc_qtile &
xautolock -time 15 -locker lock -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'" &
mpdris2-rs &
volumeicon &
nitrogen --restore &
thunderbird &
kdeconnect-indicator &
caffeine &
sleep 20 && dbus-update-activation-environment --all &