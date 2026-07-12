local map = vim.keymap.set

-- Mini.pick mappings (lazy-loaded)
map("n", "<leader><leader>", function() require("mini.pick").builtin.files() end, { desc = "Find files" })
map("n", "<leader>/", function() require("mini.pick").builtin.grep_live() end, { desc = "Live grep" })
map("n", "<leader>b", function() require("mini.pick").builtin.buffers() end, { desc = "Find buffers" })
map("n", "<leader>h", function() require("mini.pick").builtin.help() end, { desc = "Help tags" })

-- LSP Mappings (attached buffer-local)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        map("n", "<leader>d", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>q", vim.diagnostic.setloclist, opts)
        map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
