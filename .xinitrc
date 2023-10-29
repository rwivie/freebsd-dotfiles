#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/etc/X11/xinit/.Xresources
sysmodmap=/usr/local/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
	for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

#==== set resoltuion
xrandr --output DP-3 --mode 2560x1440 --rate 144.00

#==== try to set dpi
#xdpyinfo | grep -B 2 resolution (shows current)
xrandr --dpi 109

/usr/local/bin/musicpd ~/.config/mpd/mpd.conf &
export XDG_SESSION_TYPE="x11"

#==== for xfce
#. /usr/local/etc/xdg/xfce4/xinitrc

#==== for openbox
#exec openbox-session
#exec dbus-run-session openbox-session

#==== for dwm
#export XDG_SESSION_DESKTOP="dwm"
#export XDG_CURRENT_DESKTOP="dwm"
#export DESKTOP_SESSION="dwm"
#exec dbus-run-session dwmstart.sh
##exec dwmstart.sh

#==== for dk
export XDG_SESSION_DESKTOP="dk"
export XDG_CURRENT_DESKTOP="dk"
export DESKTOP_SESSION="dk"
exec dbus-run-session dkstart.sh

#==== for fvwm3
#export XDG_SESSION_DESKTOP="fvwm"
#export XDG_CURRENT_DESKTOP="fvwm"
#export DESKTOP_SESSION="fvwm"
#exec fvwmstart.sh
