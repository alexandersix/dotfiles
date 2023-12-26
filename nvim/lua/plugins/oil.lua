return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>e", "<cmd>Oil<cr>" }
    },
    config = function()
        require('oil').setup({
            view_options = {
                show_hidden = true,
            }
        })
    end
}
