hl.layer_rule(
{
    match =
    {
        namespace = "logout_dialog|swaync-control-center|swaync-notification-window|waybar|wofi"
    },
    blur = true,
})

hl.layer_rule(
{
    match =
    {
        namespace = "logout_dialog|swaync-control-center|swaync-notification-window|waybar"
    },
    ignore_alpha = 0
})

hl.layer_rule(
{
    match =
    {
        namespace = "logout_dialog"
    },
    dim_around = true,
})

hl.window_rule(
{
    name  = "fix-xwayland-drags",
    match =
    {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule(
{
    name = "starting-torrent-dl",
    match = { class = "org.qbittorrent.qBittorrent", title = "negative:(.*qBittorrent.*)" },
    float = true,
    center = true,
})
