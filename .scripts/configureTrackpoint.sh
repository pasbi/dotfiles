#!/usr/bin/env bash

echo 170 > /sys/devices/platform/i8042/serio1/serio2/sensitivity 
echo 50 > /sys/devices/platform/i8042/serio1/serio2/speed
trackpointId=$(xinput | grep "TPPS/2 IBM TrackPoint" | sed 's/.*id=//' | sed 's/\s.*//')
xinput --set-prop $trackpointId 'libinput Accel Speed' -0.5
