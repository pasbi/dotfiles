#!/usr/bin/env bash

mode=$1

if [[ $mode == "get" ]]; then
	cat /sys/class/backlight/intel_backlight/actual_brightness
elif [[ $mode == "set" ]]; then
	brightness=$2
	echo "set brightness to $brightness"
	echo $brightness > /sys/class/backlight/intel_backlight/brightness
elif [[ $mode == "get-max" ]]; then
	cat /sys/class/backlight/intel_backlight/max_brightness
else
	echo "unknown mode: '$1'"
fi
