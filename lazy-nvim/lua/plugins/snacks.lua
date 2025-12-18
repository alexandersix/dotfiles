return {
  "snacks.nvim",
  opts = {
    picker = {
      matcher = {
        frecency = true, -- Include frecency bonus
        history_bonus = true, -- Give more weight to recent items
      },
      debug = {
        scores = true,
      },
    },
    scroll = { enabled = false },
  },
}
