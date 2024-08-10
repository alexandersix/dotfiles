return {
  -- See docs here for how to add adapters: https://github.com/nvim-neotest/neotest
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",

    -- Adapters
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
    "rouge8/neotest-rust",
    "thenbe/neotest-playwright",
    "marilari88/neotest-vitest",
  },
  keys = {
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,        desc = "Run File" },
    { "<leader>ta", function() require("neotest").run.run(vim.uv.cwd() .. "/tests/") end, desc = "Run All Test Files" },
    { "<leader>tn", function() require("neotest").run.run() end,                          desc = "Run Nearest" }
  },
  opts = {
    adapters = {
      "neotest-go",
      "neotest-jest",
      "neotest-vitest",
      "neotest-rust",
      "neotest-playwright"
    }
  }

}
