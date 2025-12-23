return {
  "snacks.nvim",
  keys = {
    -- General Picker
    {
      "<leader><space>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>.",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep Files",
    },
    {
      "<leader>fo",
      function()
        Snacks.picker.recent({ filter = { cwd = true } })
      end,
      desc = "Recent Files",
    },
    {
      "<leader>bl",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },

    -- gh
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "Open Github Issues",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "All Github Issues",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "Open Github PRs",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "All Github PRs",
    },

    -- Scratch Buffer
    {
      "<leader>S",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },

    -- Terminal
    {
      "<leader>tt",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },

    -- Zen Mode
    {
      "<leader>zz",
      function()
        Snacks.zen()
      end,
      desc = "Toggle Zen Mode",
    },
  },
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
