local M = {}

M.palette = {
    name = "soft",
    bg_dim = {
        hex = "#293136"
    },
    bg0 = {
        hex = "#333c43"
    },
    bg1 = {
        hex = "#3a464c"
    },
    bg2 = {
        hex = "#434f55"
    },
    bg3 = {
        hex = "#4d5960"
    },
    bg4 = {
        hex = "#555f66"
    },
    bg5 = {
        hex = "#5d6b66"
    },
    bg_red = {
        hex = "#5c3f4f"
    },
    bg_visual = {
        hex = "#59464c"
    },
    bg_yellow = {
        hex = "#55544a"
    },
    bg_green = {
        hex = "#48584e"
    },
    bg_blue = {
        hex = "#3f5865"
    },
    red = {
        hex = "#e67e80"
    },
    orange = {
        hex = "#e69875"
    },
    yellow = {
        hex = "#dbbc7f"
    },
    green = {
        hex = "#a7c080"
    },
    blue = {
        hex = "#7fbbb3"
    },
    aqua = {
        hex = "#83c092"
    },
    purple = {
        hex = "#d699b6"
    },
    fg = {
        hex = "#d3c6aa"
    },
    statusline1 = {
        hex = "#a7c080"
    },
    statusline2 = {
        hex = "#d3c6aa"
    },
    statusline3 = {
        hex = "#e67e80"
    },
    gray0 = {
        hex = "#7a8478"
    },
    gray1 = {
        hex = "#859289"
    },
    gray2 = {
        hex = "#9da9a0"
    }
}

-- M.palette = {
--     name = "macchiato",
--     rosewater = {
--         hex = "#f4dbd6",
--         rgb = { 244, 219, 214 },
--         hsl = { 10, 0.58, 0.90 },
--     },
--     flamingo = {
--         hex = "#f0c6c6",
--         rgb = { 240, 198, 198 },
--         hsl = { 0, 0.58, 0.86 },
--     },
--     pink = {
--         hex = "#f5bde6",
--         rgb = { 245, 189, 230 },
--         hsl = { 316, 0.74, 0.85 },
--     },
--     mauve = {
--         hex = "#c6a0f6",
--         rgb = { 198, 160, 246 },
--         hsl = { 267, 0.83, 0.80 },
--     },
--     red = {
--         hex = "#ed8796",
--         rgb = { 237, 135, 150 },
--         hsl = { 351, 0.74, 0.73 },
--     },
--     maroon = {
--         hex = "#ee99a0",
--         rgb = { 238, 153, 160 },
--         hsl = { 355, 0.71, 0.77 },
--     },
--     peach = {
--         hex = "#f5a97f",
--         rgb = { 245, 169, 127 },
--         hsl = { 21, 0.86, 0.73 },
--     },
--     yellow = {
--         hex = "#eed49f",
--         rgb = { 238, 212, 159 },
--         hsl = { 40, 0.70, 0.78 },
--     },
--     green = {
--         hex = "#a6da95",
--         rgb = { 166, 218, 149 },
--         hsl = { 105, 0.48, 0.72 },
--     },
--     teal = {
--         hex = "#8bd5ca",
--         rgb = { 139, 213, 202 },
--         hsl = { 171, 0.47, 0.69 },
--     },
--     sky = {
--         hex = "#91d7e3",
--         rgb = { 145, 215, 227 },
--         hsl = { 189, 0.59, 0.73 },
--     },
--     sapphire = {
--         hex = "#7dc4e4",
--         rgb = { 125, 196, 228 },
--         hsl = { 199, 0.66, 0.69 },
--     },
--     blue = {
--         hex = "#8aadf4",
--         rgb = { 138, 173, 244 },
--         hsl = { 220, 0.83, 0.75 },
--     },
--     lavender = {
--         hex = "#b7bdf8",
--         rgb = { 183, 189, 248 },
--         hsl = { 234, 0.82, 0.85 },
--     },
--     text = {
--         hex = "#cad3f5",
--         rgb = { 202, 211, 245 },
--         hsl = { 227, 0.68, 0.88 },
--     },
--     subtext1 = {
--         hex = "#b8c0e0",
--         rgb = { 184, 192, 224 },
--         hsl = { 228, 0.39, 0.80 },
--     },
--     subtext0 = {
--         hex = "#a5adcb",
--         rgb = { 165, 173, 203 },
--         hsl = { 227, 0.27, 0.72 },
--     },
--     overlay2 = {
--         hex = "#939ab7",
--         rgb = { 147, 154, 183 },
--         hsl = { 228, 0.20, 0.65 },
--     },
--     overlay1 = {
--         hex = "#8087a2",
--         rgb = { 128, 135, 162 },
--         hsl = { 228, 0.15, 0.57 },
--     },
--     overlay0 = {
--         hex = "#6e738d",
--         rgb = { 110, 115, 141 },
--         hsl = { 230, 0.12, 0.49 },
--     },
--     surface2 = {
--         hex = "#5b6078",
--         rgb = { 91, 96, 120 },
--         hsl = { 230, 0.14, 0.41 },
--     },
--     surface1 = {
--         hex = "#494d64",
--         rgb = { 73, 77, 100 },
--         hsl = { 231, 0.16, 0.34 },
--     },
--     surface0 = {
--         hex = "#363a4f",
--         rgb = { 54, 58, 79 },
--         hsl = { 230, 0.19, 0.26 },
--     },
--     base = {
--         hex = "#24273a",
--         rgb = { 36, 39, 58 },
--         hsl = { 232, 0.23, 0.18 },
--     },
--     mantle = {
--         hex = "#1e2030",
--         rgb = { 30, 32, 48 },
--         hsl = { 233, 0.23, 0.15 },
--     },
--     crust = {
--         hex = "#181926",
--         rgb = { 24, 25, 38 },
--         hsl = { 236, 0.23, 0.12 },
--     },
-- }

return M
