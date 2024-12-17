return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = "manual",
      },
    },
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
