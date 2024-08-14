#!/bin/bash
#
# This will run everytime a window manager is launched, such as DWM or i3

xset r rate 300 50 &
xwallpaper --zoom $HOME/.local/share/wallpaper &
setxkbmap gb &
xrdb ~/.Xresources &
picom -fc &
unclutter --timeout 3 --start-hidden &
xsetroot -cursor_name left_ptr &

[ ! -z "$(pgrep 'dwm')" ] && dwmblocks

