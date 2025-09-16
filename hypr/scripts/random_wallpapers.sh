#!/usr/bin/env bash

WALLPAPER_SCRIPT=$(realpath $0)
UNIT_NAME=wallpaperRandomizer

if [[ ! -f "${XDG_RUNTIME_DIR}/hyprpaper.lock" ]]; then
    systemctl --user start hyprpaper.service
    sleep 1
fi

disableTimer()
{
    echo "Stoping random wallpaper service"
    systemctl --user stop $UNIT_NAME.timer
    exit 1
}

enableTimer()
{
    echo "Starting random wallpaper service"
    systemd-run --user --unit="$UNIT_NAME" --on-calendar="*:0/5" $WALLPAPER_SCRIPT --silent
    exit 1
}

toggleTimer()
{
    timers=$(systemctl --user list-timers --all)
    if [[ ! $( echo $timers | grep "$UNIT_NAME.timer" ) ]]; then
        enableTimer
    else
        disableTimer
    fi
}

randomize()
{
    WALLPAPER_DIRECTORY=$HOME/Pictures/backgrounds
    MONITORS=$(hyprctl --instance 0 monitors active | awk '{for (I=1;I<NF;I++) if ($I == "Monitor") print $(I+1)}')

    readarray -t  CURRENT_WALLPAPERS  <<< "$(hyprctl --instance 0 hyprpaper listloaded)"

    for MONITOR in $MONITORS
    do
        WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f ! -name "$(basename "${CURRENT_WALLPAPERS[0]}")" ! -name "$(basename "${CURRENT_WALLPAPERS[1]}")" | shuf -n 1)
        if [[ $MONITOR == "DP-1" ]]; then
            $HOME/.config/hypr/scripts/generate_color_schemes.sh $WALLPAPER  
        fi
        setsid hyprctl --instance 0 hyprpaper reload "$MONITOR,$WALLPAPER"
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
