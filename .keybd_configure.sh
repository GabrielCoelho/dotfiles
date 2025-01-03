#!/usr/bin/env bash
setxkbmap motiondvorak
xrandr --newmode "1536x864_60.00"  109.25  1536 1624 1784 2032  864 867 872 897 -hsync +vsync
xrandr --addmode eDP-1 "1536x864_60.00"
xrandr --output eDP-1 --mode "1536x864_60.00"
espanso start --unmanaged
tmux new -d -s main -n second-brain -c ~/.vaults/my_brain/
tmux neww -n configs
tmux neww -n dev
