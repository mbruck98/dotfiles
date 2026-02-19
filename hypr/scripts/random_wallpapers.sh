#!/usr/bin/env bash

WALLPAPER_SCRIPT=$(realpath $0)
UNIT_NAME=wallpaperRandomizer
MAIN_MONITOR="DP-1"

if [[ ! -f "${XDG_RUNTIME_DIR}/hyprpaper.lock" ]]; then
    systemctl --user start hyprpaper.service
    sleep 1
fi

disableTimer()
{
    echo "Stoping random wallpaper service"
    systemctl --user stop $UNIT_NAME.timer
    exit 0
}

enableTimer()
{
    echo "Starting random wallpaper service"
    systemd-run --user --unit="$UNIT_NAME" --on-calendar="*:0/5" $WALLPAPER_SCRIPT --silent
    exit 0
}

toggleTimer()
{
    TIMERS=$(systemctl --user list-timers --all)
    if [[ ! $( echo $TIMERS | grep "$UNIT_NAME.timer" ) ]]; then
        enableTimer
    else
        disableTimer
    fi
}

randomize()
{
    WALLPAPER_DIRECTORY=$HOME/Pictures/backgrounds
    MONITORS=$(hyprctl --instance 0 monitors active | awk  '/Monitor/ {print $2}')

    sleep 0.05

    for MONITOR in $MONITORS
    do
        PREVIOUS_WALLPAPER=$(basename $(cat $HOME/.cache/wal/wal))
        WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f ! -name "$PREVIOUS_WALLPAPER" | shuf -n 1)
        if [[ $MONITOR == $MAIN_MONITOR ]]; then
            $HOME/.config/hypr/scripts/generate_color_schemes.sh $WALLPAPER
        fi
        setsid hyprctl --instance 0 hyprpaper wallpaper "$MONITOR,$WALLPAPER"
        sleep 0.05
    done
}

if [[ " $* " =~ " --enable" ]]; then
    enableTimer
fi

if [[ " $* " =~ " --disable" ]]; then
    disableTimer
fi

if [[ " $* " =~ " --toggle" ]]; then
    toggleTimer
fi

randomize

if [[ ! " $* " =~ " --silent" ]]; then
    notify-send -e -t 1000 "Randomizing wallpapers 󰆊 " 
fi
