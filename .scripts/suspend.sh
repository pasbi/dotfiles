#!/usr/bin/env bash

# suspend only if the batteries are discharching. Otherwise (connected to grid), lock only.

is_discharging=$((upower -i /org/freedesktop/UPower/devices/battery_BAT0; upower -i /org/freedesktop/UPower/devices/battery_BAT1) | grep discharging | wc -l)
echo "is_discharging: $is_discharging"

if [[ "$is_discharging" -gt 0 ]]; then
  VBoxManage controlvm Win10 pause
fi

i3lock -i $(dirname $0)/lockscreen.png

if [[ "$is_discharging" -gt 0 ]]; then
  systemctl suspend
  VBoxManage controlvm Win10 resume
fi