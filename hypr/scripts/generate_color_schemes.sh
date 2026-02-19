#!/usr/bin/env bash

WALLPAPER=$1

wal -i $WALLPAPER -s -t -q -e
cp $HOME/.cache/wal/wal.ron $HOME/.config/rmpc/themes/wal.ron
setsid pywalfox update &
setsid swaync-client -rs &
