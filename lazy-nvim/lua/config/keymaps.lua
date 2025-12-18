-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Window Manipulation
vim.keymap.set("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Create vertical split" })
vim.keymap.set("n", "<leader>wn", "<cmd>sp<cr>", { desc = "Create horizontal split" })
vim.keymap.set("n", "<leader>wo", "<C-W>o", { desc = "Close all other splits" })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Move to below split" })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Move to above split" })
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Move to right split" })
vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Move to right split" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close split" })

-- Split Management
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>bj", "<C-^>", { desc = "Jump to previous buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Jump to next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Jump to previous buffer" })

-- File Handling
vim.keymap.set("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit current buffer" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better line joining behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Better movement
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "H", "^", { desc = "Move to first character of line" })
vim.keymap.set("n", "L", "$", { desc = "Move to last character of line" })

-- Better undo breakpoints
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("i", "!", "!<C-g>u")
vim.keymap.set("i", "?", "?<C-g>u")
vim.keymap.set("i", ">", "><C-g>u")
vim.keymap.set("i", "<", "<<C-g>u")

-- Fix Y
vim.keymap.set("n", "Y", "y$", { desc = "Copy to end of line" })

-- Disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- LSP
-- vim.keymap.set("n", "gd", function()
--   vim.lsp.buf.definition()
-- end)
-- vim.keymap.set("n", "gx", function()
--   vim.diagnostic.open_float()
-- end)
-- vim.keymap.set("n", "K", function()
--   vim.lsp.buf.hover({
--     border = true,
--   })
-- end)
