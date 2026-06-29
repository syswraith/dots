return {
    "dybdeskarphet/gruvbox-minimal.nvim",
    lazy = false,
    priority = 1000,

    config = function()
        require("gruvbox-minimal").setup({
            transparent = true,
        })

        vim.cmd.colorscheme("gruvbox-minimal")
    end,
}
