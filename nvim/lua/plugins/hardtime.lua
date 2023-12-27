return {
    "m4xshen/hardtime.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("hardtime").setup({
            max_count = 5
        })
    end
}
