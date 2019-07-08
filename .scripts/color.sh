#!/usr/bin/env bash

choice=$(echo -e "day\nnight" | dmenu)

case "$choice" in
  "day")
    wal -l --theme github
    ;;
  "night")
    wal --theme base16-atelier-savanna
    ;;
  *)
    ;;
esac
