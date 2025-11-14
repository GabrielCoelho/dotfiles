#!/bin/bash
# Salve em: ~/.config/i3/scripts/mouse_move.sh

SPEED=10
DELAY=0.01

case "$1" in
    up)
        while true; do
            xdotool mousemove_relative -- 0 -$SPEED
            sleep $DELAY
        done
        ;;
    down)
        while true; do
            xdotool mousemove_relative -- 0 $SPEED
            sleep $DELAY
        done
        ;;
    left)
        while true; do
            xdotool mousemove_relative -- -$SPEED 0
            sleep $DELAY
        done
        ;;
    right)
        while true; do
            xdotool mousemove_relative -- $SPEED 0
            sleep $DELAY
        done
        ;;
    up-left)
        while true; do
            xdotool mousemove_relative -- -$SPEED -$SPEED
            sleep $DELAY
        done
        ;;
    up-right)
        while true; do
            xdotool mousemove_relative -- $SPEED -$SPEED
            sleep $DELAY
        done
        ;;
    down-left)
        while true; do
            xdotool mousemove_relative -- -$SPEED $SPEED
            sleep $DELAY
        done
        ;;
    down-right)
        while true; do
            xdotool mousemove_relative -- $SPEED $SPEED
            sleep $DELAY
        done
        ;;
    stop)
        pkill -f "mouse_move.sh"
        ;;
esac
