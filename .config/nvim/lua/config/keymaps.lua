local map = vim.keymap.set
local pick = require("mini.pick")

vim.keymap.set("n", "<leader><leader>", pick.builtin.files)
vim.keymap.set("n", "<leader>/", pick.builtin.grep_live)
vim.keymap.set("n", "<leader>b", pick.builtin.buffers)
vim.keymap.set("n", "<leader>h", pick.builtin.help)
