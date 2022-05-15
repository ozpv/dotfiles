#!/bin/sh

xsetroot -cursor_name left_ptr &

dwmblocks 2>&1 >/dev/null &

picom &
nitrogen --restore &
start-pulseaudio-x11 &

exec dwm
