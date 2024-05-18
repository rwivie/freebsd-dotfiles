#!/bin/sh

sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 254x35 -n hidden -e htop &
sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 254x35 -n hidden -e grc tail -f /var/log/messages &
sleep 10 && st -f "JetBrainsMono Nerd Font:style:regular:pixelsize=16" -g 254x35 -n hidden -e grc tail -f ~/.logs/dwm/*-*-*_*.dwm.log &