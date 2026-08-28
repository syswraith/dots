return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            terminal_colors = true,
            contrast = "soft",
            bold = true,
            italic = {
                strings = false,
                comments = true,
            },
        })

        vim.cmd.colorscheme("gruvbox")
    end,
}
