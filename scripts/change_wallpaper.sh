#!/usr/bin/zsh

waypaper $1
wall=$(waypaper --list | jq -r '.[].wallpaper')
wal -i $wall
hyprpanel setWallpaper $wall
