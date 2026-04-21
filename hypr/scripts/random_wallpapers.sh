#!/usr/bin/env bash

readonly WALLPAPER_SCRIPT=$(realpath $0)
readonly UNIT_NAME=wallpaperRandomizer
readonly MAIN_MONITOR="DP-1"
readonly TIMEOUT=5 # minutes

randomize()
{
    local -r WALLPAPER_DIRECTORY=$HOME/Pictures/backgrounds
    local -r MONITORS=$(hyprctl --instance 0 monitors active | awk  '/Monitor/ {print $2}')
    sleep 0.05
    for MONITOR in $MONITORS
    do
        local PREVIOUS_WALLPAPER=$(basename $(cat $HOME/.cache/wal/wal))
        local WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f ! -name "$PREVIOUS_WALLPAPER" | shuf -n 1)
        if [[ $MONITOR == $MAIN_MONITOR ]]; then
            $HOME/.config/hypr/scripts/generate_color_schemes.sh $WALLPAPER
        fi
        hyprctl --instance 0 hyprpaper wallpaper "$MONITOR,$WALLPAPER"
        sleep 0.05
    done
}

disableTimer()
{
    crontab -l | grep -v "$WALLPAPER_SCRIPT" | crontab -
}

enableTimer()
{
    local -r CRONJOB=$(crontab -l | grep "$WALLPAPER_SCRIPT")
    if [[ $CRONJOB ]]; then # remove old cronjobs
        disableTimer
    fi
    local -r XDG_RUNTIME_DIR=/run/user/$(id -u)
    HYPRLAND_INSTANCE_SIGNATURE=$(hyprctl instances | awk '/instance/ {print substr($2,1,length($2)-1)}')
    while [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]  # wait for hyprland to finish init
    do
        sleep 0.5
        HYPRLAND_INSTANCE_SIGNATURE=$(hyprctl instances | awk '/instance/ {print substr($2,1,length($2)-1)}')
    done
    randomize
    (crontab -l ; echo "*/$TIMEOUT * * * * XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR HYPRLAND_INSTANCE_SIGNATURE=$HYPRLAND_INSTANCE_SIGNATURE $WALLPAPER_SCRIPT --silent") | crontab -
}

toggleTimer()
{
    local -r CRONJOB=$(crontab -l | grep "$WALLPAPER_SCRIPT")
    if [[ ! $CRONJOB ]]; then
        enableTimer
        notify-send -e -t 1000 "Enabling wallpaper randomizer 󰆊 "
    else
        disableTimer
        notify-send -e -t 1000 "Disabling wallpaper randomizer 󰆊 "
    fi
}



if [[ " $* " =~ " --enable" ]]; then
    enableTimer
    exit 0
fi

if [[ " $* " =~ " --disable" ]]; then
    disableTimer
    exit 0
fi

if [[ " $* " =~ " --toggle" ]]; then
    toggleTimer
    exit 0
fi

randomize

if [[ ! " $* " =~ " --silent" ]]; then
    notify-send -e -t 1000 "Randomizing wallpapers 󰆊 " 
fi
