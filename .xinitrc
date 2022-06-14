#!/bin/sh

xsetroot -cursor_name left_ptr &

dwmblocks 2>&1 >/dev/null &

picom --experimental-backends &
nitrogen --restore &
start-pulseaudio-x11 &
mpd &

exec dwm
