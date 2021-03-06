#!/usr/bin/env bash

choice=$(echo -e "day\nnight" | dmenu)

case "$choice" in
  "day")
    wal -l --theme base16-atelier-lakeside
    ;;
  "night")
    wal --theme base16-atelier-savanna
    ;;
  *)
    ;;
esac
