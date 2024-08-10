return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<S-CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
    })

    opts.preselect = cmp.PreselectMode.None

    opts.completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    }

    opts.experimental = {
      ghost_text = false,
    }

    return opts
  end,
}
