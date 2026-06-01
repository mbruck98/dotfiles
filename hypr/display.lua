require("colors-hyprland")

hl.config(
{
    general =
    {
        gaps_in = 5,
        gaps_out = 5,

        border_size = 2,

        col =
        {
            active_border =
            {
                colors = { colors.color14, colors.color15 },
                angle = 45
            },
            inactive_border = colors.color8
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration =
    {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow =
        {
            enabled      = false
        },

        blur =
        {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    xwayland =
    {
        force_zero_scaling = true
    }
})
