vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0              -- hide the command bar
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.undofile = true            -- persistent undo across sessions
vim.opt.scrolloff = 8              -- keep 8 lines around the cursor
vim.opt.updatetime = 50            -- snappy CursorHold
vim.opt.hlsearch = false           -- don't highlight all matches
vim.opt.fcs = 'eob: '             -- hide those ugly ~ at end of file
vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
