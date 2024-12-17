return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>.", LazyVim.pick("live_grep"), desc = "Live Grep" },
    { "<leader>fo", LazyVim.pick("oldfiles"), desc = "Oldfiles" },
  },
  opts = {
    files = {
      fzf_opts = {
        ["--layout"] = "default",
      },
    },
  },
}
