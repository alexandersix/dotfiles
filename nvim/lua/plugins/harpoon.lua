return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>fm", function() require("harpoon.mark").add_file() end },
        { "<leader>fh", function() require("harpoon.ui").toggle_quick_menu() end },
        { "<leader>fj", function() require("harpoon.ui").nav_file(1) end },
        { "<leader>fk", function() require("harpoon.ui").nav_file(2) end },
        { "<leader>fl", function() require("harpoon.ui").nav_file(3) end },
        { "<leader>f;", function() require("harpoon.ui").nav_file(4) end },
    },
    config = function()
        local get_win_size = function()
            local win_width = vim.api.nvim_win_get_width(0) - 24
            -- local min_harpoon_size = 64
            local max_harpoon_size = 124

            -- if win_width < min_harpoon_size then
            --     return min_harpoon_size
            -- end

            if win_width > max_harpoon_size then
                return max_harpoon_size
            end

            return win_width
        end

        require('harpoon').setup({
            menu = {
                width = get_win_size()
            }
        })
    end
}
