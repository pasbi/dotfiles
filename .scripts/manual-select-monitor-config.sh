#!/usr/bin/env bash

$HOME/.screenlayout/$(ls $HOME/.screenlayout | sed s/.sh$// | dmenu).sh
