return {
    -- "ayu-theme/ayu-vim",
    -- priority = 1000,
    -- config = function()
    --     vim.g.ayucolor = "mirage"
    --     vim.cmd([[colorscheme ayu]])
    --     vim.cmd([[
    --       highlight Normal guibg=none
    --       highlight NonText guibg=none
    --       highlight Normal ctermbg=none
    --       highlight NonText ctermbg=none
    --     ]])
    -- end,

    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("onedark").setup({
            transparent = true,
            style = "darker",

            lualine = {
                transparent = true, -- lualine center bar transparency
            },
        })

        -- Enable theme
        require("onedark").load()
    end,
}
