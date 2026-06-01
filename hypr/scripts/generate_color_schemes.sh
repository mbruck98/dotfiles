#!/usr/bin/env bash

readonly WALLPAPER=$1

wal -i $WALLPAPER -s -t -q -e
cp $HOME/.cache/wal/wal.ron $HOME/.config/rmpc/themes/wal.ron
cp $HOME/.cache/wal/colors-hyprland.lua $HOME/.config/hypr/colors-hyprland.lua
setsid pywalfox update &
setsid swaync-client -rs &
