vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("AutoMkdir", { clear = true }),
  callback = function(event)
    -- Skip special URLs (e.g. oil://, fugitive://, zipfile://)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end

    local file = vim.uv.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ":p:h")

    -- Create missing directories recursively (mkdir -p equivalent)
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})
