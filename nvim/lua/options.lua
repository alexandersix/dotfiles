local set = vim.opt

set.fileencoding = "utf-8"
set.spelllang = "en"
set.clipboard = "unnamedplus"
set.signcolumn = "yes"                              -- Always show the sign column
set.foldmethod = "manual"                           -- Manually create folds
set.completeopt = { "menu", "menuone", "noselect" } -- Insert mode completion options
set.colorcolumn = "100"
set.backup = false                                  -- Disable backup files
set.hidden = true                                   -- Ignore unsaved buffers
set.hlsearch = false                                -- No highlight of matching search pattern
set.ignorecase = true                               -- Case insensitive searching
set.spell = false                                   -- Disable spell checking and highlighting
set.showmode = false                                -- Disable showing modes in command line
set.smartindent = true                              -- Auto-indent when starting a new line
set.splitbelow = true                               -- Split down
set.splitright = true                               -- Split right
set.swapfile = false                                -- Disable the use of a swapfile
set.termguicolors = true                            -- Enable 24-bit RGB colors in the TUI
set.undofile = true                                 -- Enable persistent undo
set.writebackup = false                             -- Disable making a backup before overwriting a file
set.cursorline = true                               -- Highlight the current line
set.number = true
set.relativenumber = true
set.wrap = false
set.conceallevel = 0 -- Show text normally
set.cmdheight = 1
set.shiftwidth = 4
set.tabstop = 4               -- Number of spaces in a tab
set.scrolloff = 8             -- Number of lines above and below cursor
set.sidescrolloff = 8         -- Number of columns beside the cursor
set.timeoutlen = 300          -- Length of time to wait for a mapped sequence
set.updatetime = 300          -- Length of time to wait before triggering the plugin
set.fillchars = { eob = " " } -- Disable '~' on nonexistent lines
set.nu = true
set.errorbells = false
set.incsearch = true
set.wildmode = "longest:full,full"
