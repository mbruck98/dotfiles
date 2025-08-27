#!/usr/bin/env bash

if [[ ! -f "${XDG_RUNTIME_DIR}/hyprpaper.lock" ]]; then
    systemctl --user start hyprpaper.service || setsid hyprpaper &
    sleep 1
fi

WALLPAPER_DIRECTORY=$HOME/Pictures/backgrounds
MONITORS=$(hyprctl monitors active | awk '{for (I=1;I<NF;I++) if ($I == "Monitor") print $(I+1)}')

sleep 0.1

for MONITOR in $MONITORS
do
    WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)
    hyprctl hyprpaper reload "$MONITOR,$WALLPAPER"
    sleep 0.1
done

