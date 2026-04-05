#!/usr/bin/env bash

cd $HOME
mode=$(echo -e "Region\nMonitor\nWindow\nActive Monitor\nActive Window" | wofi --dmenu --lines 6 --width 250 --hide-search)

case "$mode" in
"Region")
    hyprshot -m region --clipboard-only
;;
"Monitor")
    hyprshot -m output --clipboard-only
;;
"Window")
    hyprshot -m window --clipboard-only
;;
"Active Monitor")
    $(sleep 0.1 && hyprshot -m output -m active --clipboard-only)&
;;
"Active Window")
    $(sleep 0.1 && hyprshot -m window -m active --clipboard-only)&
;;
*)
    notify-send "ERROR: Nothing selected" -e -t 2000
;;
esac
