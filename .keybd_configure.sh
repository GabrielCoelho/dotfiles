#!/usr/bin/env bash
setxkbmap -model pc105 -layout br -variant dvorak
xrandr --newmode "1536x864_60.00"  109.25  1536 1624 1784 2032  864 867 872 897 -hsync +vsync
xrandr --addmode eDP-1 "1536x864_60.00"
xrandr --output eDP-1 --mode "1536x864_60.00"
tmux new -d -s second-brain
tmux new -d -s configs
tmux new -d -s dev
