return {
  "MagicDuck/grug-far.nvim",
  keys = {
    {
      "<leader>fr",
      function()
        require("grug-far").open()
      end,
    },
  },
}
