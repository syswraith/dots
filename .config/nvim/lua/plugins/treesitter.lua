return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        -- 1. Setup the plugin
        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site"
        })
        
        -- 2. Cleanly install your needed parsers
        ts.install({
            "lua",
            "go",
            "python",
            "typescript",
            "c",
            "cpp",
            "vim",
            "vimdoc",
            "query"
        })

        -- 3. Enable native syntax highlighting for these file types
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "lua", "go", "python", "typescript", "c", "cpp", "vim", "query" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
