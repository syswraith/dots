require("syswraith.set")
require("config.lazy")
require("config.keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        require("oil").open(vim.fn.getcwd())
      end)
    end
  end,
})
