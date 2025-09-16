#!/usr/bin/env bash

WALLPAPER=$1

wal -i $WALLPAPER -s -t -q -e --cols16
setsid pywalfox update
setsid swaync-client -rs
