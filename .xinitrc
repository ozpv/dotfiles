#!/bin/sh

mpd &
dunst 2> /dev/null &
picom --experimental-backends &
nitrogen --restore &
dwmblocks &
start-pulseaudio-x11 &

exec dwm
