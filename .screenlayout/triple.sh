#!/bin/sh
xrandr --output eDP-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --scale 0.8x0.8 \
       --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --off \
       --output DP-2-2 --mode 1920x1080 --pos 2048x0 --rotate normal --primary \
       --output DP-2-3 --mode 1920x1080 --pos 3968x0 --rotate normal \
       --verbose
