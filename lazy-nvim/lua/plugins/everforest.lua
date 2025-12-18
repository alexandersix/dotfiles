return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    local is_light_mode = false

    require("everforest").setup({
      transparent_background_level = 1,
      background = is_light_mode and "hard" or "soft",
      on_highlights = function(hl, palette)
        hl.CurSearch = { fg = palette.bg0, bg = palette.statusline1 }
        hl.IncSearch = { fg = palette.bg0, bg = palette.statusline1 }
        hl.Search = { fg = palette.bg0, bg = palette.statusline1 }
        hl.Visual = { fg = palette.fg, bg = palette.bg_green }
      end,
    })

    if is_light_mode then
      vim.cmd([[:set background=light]])
    end

    vim.cmd.colorscheme("everforest")
  end,
}
