configDir = os.getenv("HOME") .. "/.config"

testScript = configDir .. "/hypr/scripts/testScript.sh"
terminal = "kitty -d \"$(hyprcwd)\""
fileManager = "dolphin \"$(hyprcwd)\""
menu = "wofi --show drun --prompt Apps -I"
browser = "librewolf"
screenshot = configDir .. "/hypr/scripts/screenshot.sh"
randomWallpapers = configDir .. "/hypr/scripts/random_wallpapers.sh"
logoutMenu = configDir .. "/wlogout/logout_menu.sh 1"

