vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.o.swapfile = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.background = "dark"


vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")


local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('neoclide/coc.nvim', { ['branch'] = 'release' })
Plug('ellisonleao/gruvbox.nvim')

vim.call('plug#end')


vim.cmd("colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")


-- Tab completion
vim.keymap.set("i", "<TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn
  elseif vim.fn.col(".") == 1 or vim.fn.getline("."):sub(vim.fn.col(".")-1, vim.fn.col(".")-1):match("%s") then
    return "\t"
  else
    return vim.fn["coc#refresh"]()
  end
end, {expr = true, silent = true})

vim.keymap.set("i", "<S-TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn
  else
    return "<C-h>"
  end
end, {expr = true, silent = true})

-- Enter confirms completion
vim.keymap.set("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  else
    return "\n"
  end
end, {expr = true, silent = true})

-- Go to definition
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})

-- Hover documentation
vim.keymap.set("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true})

-- Diagnostics navigation
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
