return {
  "snacks.nvim",
  keys = {
    {
      "<leader>E",
      function()
        Snacks.explorer()
      end,
    },
    { "<leader>e", false },
  },
  opts = {
    picker = {
      matcher = {
        frecency = true,
      },
      sources = {
        explorer = {
          auto_close = true,
          layout = { layout = { position = "right" }, preset = "sidebar", preview = false },
          matcher = { fuzzy = true },
        },
        lsp_symbols = {
          layout = { layout = { position = "right" }, preset = "vscode", preview = false },
        },
      },
    },
    scroll = { enabled = false },
    -- TODO: matcher.history_bonus or frecency to sort oldfiles by last opened
  },
}
