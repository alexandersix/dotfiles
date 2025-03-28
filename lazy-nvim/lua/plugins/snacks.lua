return {
  "snacks.nvim",
  keys = {
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
    },
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
  },
}
