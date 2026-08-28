return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site"
        })

        -- Dynamically check and install only missing parsers to optimize startup
        local missing = {}
        local installed = ts.get_installed()
        local desired = { "nim", "lua", "go", "python", "typescript", "c", "cpp", "vim", "vimdoc", "query" }
        for _, lang in ipairs(desired) do
            if not vim.list_contains(installed, lang) then
                table.insert(missing, lang)
            end
        end

        if #missing > 0 then
            ts.install(missing)
        end

        -- Enable native syntax highlighting for these file types
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "nim", "lua", "go", "python", "typescript", "c", "cpp", "vim", "query" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
