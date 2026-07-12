return {
    {
        "saghen/blink.cmp",
        version = "*",

        dependencies = {
            "rafamadriz/friendly-snippets",
        },

        config = function(_, opts)
            require("blink.cmp").setup(opts)

            if vim.lsp.config then
                vim.lsp.config("*", {
                    capabilities = require("blink.cmp").get_lsp_capabilities(),
                })
            end
        end,

        opts = {
            keymap = {
                preset = "default",

                ["<CR>"] = {
                    "accept",
                    "fallback",
                },
            },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },

                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },
            },

            sources = {
                default = {
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
            },
        },
    },
}
