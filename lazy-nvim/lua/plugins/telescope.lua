return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>.",  LazyVim.pick("live_grep"),                        desc = "Grep (Root Dir)" },
    { "<leader>fo", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent Files" }
  }
}
