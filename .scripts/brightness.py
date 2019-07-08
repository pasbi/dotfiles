#!/usr/bin/env python3

import math
import subprocess
import numpy as np
import os
import sys

# mimics `xbacklight -inc ?` and `xbacklight -dec ?`
# xbacklight increases linear, i.e. steps in bright
# regions are too fine while those in dark regions
# are too coarse.

# if the extreme is (not bright enough or) too bright,
# you might want to use  
#		xrandr --output eDP1 --brightness xc`
# where 0<=x<=1 for x>1, the image looks ugly.

def exec(cmd):
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
	o, e = p.communicate()
	return o.decode('utf-8')[:-1]

os.chdir(os.path.dirname(sys.argv[0]))
if False:
	# this does not work on arch (https://wiki.archlinux.org/index.php/backlight#xbacklight)
	brightnesses = np.array([1, 2, 3, 6, 12, 25, 50, 100])
	current_brightness = float(exec(['xbacklight', '-get']))
	set_brightness = lambda x: exec(['xbacklight', '-set', str(x)])

else:
	# add to your sudoers file:
	# `$USER ALL=(ALL:ALL) NOPASSWD:$HOME/.scripts/brightness.sh

	max_brightness = float(exec(["sudo", "./brightness.sh", "get-max"]))
	min_brightness = 20
	base = 10
	steps = 10
	brightnesses = np.logspace(math.log(min_brightness, base), math.log(max_brightness, base), steps)
	brightnesses = np.array(list(map(lambda x: int(round(x)), brightnesses)))
	print(brightnesses)
	current_brightness = float(exec(["sudo", "./brightness.sh", "get"]))
	set_brightness = lambda x: exec(["sudo", './brightness.sh', 'set', str(x)])




i = np.argmin(np.abs(brightnesses - current_brightness))

if sys.argv[1] == "inc":
	i += 1
elif sys.argv[1] == "dec":
	i -= 1

i = np.clip(i, 0, len(brightnesses) - 1)
print("set brightness ", i, brightnesses[i])
set_brightness(brightnesses[i])
