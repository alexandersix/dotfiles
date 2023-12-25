return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
        require('gitblame').setup({
            -- Switch to `false` to disable until :GitBlameToggle is run
            enabled = true,
        })
    end
}
