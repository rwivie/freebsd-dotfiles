#!/bin/sh

#dwm_debug.sh
xrdb merge ~/.Xresources &
nitrogen --restore &
/usr/local/libexec/polkit-gnome-authentication-agent-1 &
numlockx on &
dunst -conf ~/.config/dunst/dunstrc &
picom --config ~/.config/picom/picom_dwm.conf  --daemon &
(sleep 1; xautolock -time 10 -locker lock -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'") &
sleep 10 && /usr/local/bin/musicpd ~/.config/mpd/mpd.conf &
caffeine &
volumeicon &
$HOME/.config/dwmblocks/dwmblocks &

exec dbus-launch --exit-with-x11 ck-launch-session $HOME/.config/dwm/dwm >> $HOME/.logs/dwm/$(date +%Y-%m-%d_%H.dwm.log) 2>&1