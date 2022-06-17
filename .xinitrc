#!/bin/sh

mpd &
dunst &
picom --experimental-backends &
nitrogen --restore &
dwmblocks &
start-pulseaudio-x11 &

exec dwm
