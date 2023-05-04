#!/bin/sh

mpd &
dunst 2> /dev/null &
start-pulseaudio-x11 &
picom --experimental-backends &
dwmblocks &
xwallpaper --zoom /usr/share/wallpapers/wallpaper.png

exec dwm
