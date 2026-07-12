return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
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

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            vim.lsp.enable({
                "lua_ls",
                "gopls",
                "pyright",
                "ts_ls",
                "clangd",
            })

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                severity_sort = true,
                update_in_insert = false,
            })
        end,
    },
}


