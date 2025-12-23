return {
  "stevearc/conform.nvim",
  optional = true,
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>ff",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer", "pint", stop_after_first = true },
    },
    formatters = {
      php_cs_fixer = {
        cwd = require("conform.util").root_file({ ".use-cs-fixer" }),
        require_cwd = true,
      },
    },
  },
}
