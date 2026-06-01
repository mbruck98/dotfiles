hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("waybar")
  hl.exec_cmd(randomWallpapers .. " --enable")
  hl.exec_cmd("dbus-update-activation-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

