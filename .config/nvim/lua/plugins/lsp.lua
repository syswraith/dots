return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                    "pyright",
                    "ts_ls",
                    "clangd",
                },
            })

            vim.lsp.config("lua_ls", {})
            vim.lsp.config("gopls", {})
            vim.lsp.config("pyright", {})
            vim.lsp.config("ts_ls", {})
            vim.lsp.config("clangd", {})

            vim.lsp.enable({
                "lua_ls",
                "gopls",
                "pyright",
                "ts_ls",
                "clangd",
            })
        end,
    },
}
