-- -- This file needs to have same structure as nvconfig.lua
-- -- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- -- Please read that file to know all available options :(
local M = {}

M.base46 =
{
    theme = "ayu_dark",

    nvdash =
    {
        load_on_startup = true,
    },

    hl_override =
    {
        colors =
        {
            green = "#6A9955",
            cyan = "#4EC9B0",
            blue = "#569cd6",
            light_blue = "#87CEFA",
            purple = "#C586C0",
            brown = "#bd8d78",
            beige = "#b5cea8",
            yellow = "#dcdcaa",
        },
    },
}

local set_hlgroup_color = function(keys,color)
    for _, key in ipairs(keys) do
        M.base46.hl_override[key] = { fg = color }
    end
end

set_hlgroup_color(
{
    "@comment",
}, M.base46.hl_override.colors.green)


set_hlgroup_color(
{
    "@attribute",
    "@module",
    "Type",
}, M.base46.hl_override.colors.cyan)

set_hlgroup_color(
{
    "@boolean",
    "Boolean",
    "@keyword",
    "@constant",
    "@constant.builtin",
    "@constant.macro",
    "@function.builtin",
    "@keyword.exception",
    "@keyword.operator",
    "@variable.builtin",
    "@type.builtin",
}, M.base46.hl_override.colors.blue)

set_hlgroup_color(
{
    "@variable",
    "@variable.member",
    "@variable.parameter",
    "@property",
}, M.base46.hl_override.colors.light_blue)

set_hlgroup_color(
{
    "@function",
    "@function.call",
    "@function.method",
    "@function.method.call",
}, M.base46.hl_override.colors.yellow)

set_hlgroup_color(
{
    "@keyword.conditional",
    "@keyword.directive",
    "@keyword.directive.define",
    "@keyword.repeat",
    "@keyword.return",
    "Include",
}, M.base46.hl_override.colors.purple)

set_hlgroup_color(
{
    "@character",
    "@string",
}, M.base46.hl_override.colors.brown)

set_hlgroup_color(
{
    "@number"
}, M.base46.hl_override.colors.beige)

return M
