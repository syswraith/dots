local header = [[
   
   .▄▄ ·  ▄· ▄▌.▄▄ · ▄▄▌ ▐ ▄▌▄▄▄   ▄▄▄· ▪  ▄▄▄▄▄ ▄ .▄
   ▐█ ▀. ▐█▪██▌▐█ ▀. ██· █▌▐█▀▄ █·▐█ ▀█ ██ •██  ██▪▐█
   ▄▀▀▀█▄▐█▌▐█▪▄▀▀▀█▄██▪▐█▐▐▌▐▀▀▄ ▄█▀▀█ ▐█· ▐█.▪██▀▐█
   ▐█▄▪▐█ ▐█▀·.▐█▄▪▐█▐█▌██▐█▌▐█•█▌▐█ ▪▐▌▐█▌ ▐█▌·██▌▐▀
    ▀▀▀▀   ▀ •  ▀▀▀▀  ▀▀▀▀ ▀▪.▀  ▀ ▀  ▀ ▀▀▀ ▀▀▀ ▀▀▀ ·
           "Magic blooms only in rare souls"  
]]

return {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
        require("mini.pick").setup()
        require("mini.hipatterns").setup()
--        require("mini.notify").setup()
        require("mini.align").setup()
        require("mini.starter").setup({
            header = header,
            items  = { require('mini.starter').sections.builtin_actions()},
            footer = '',
        })
    end,
}

