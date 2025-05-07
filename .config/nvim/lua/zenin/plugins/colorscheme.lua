return {
    "ayu-theme/ayu-vim",
    priority = 1000,
    config = function()
        vim.g.ayucolor = "mirage"
        vim.cmd([[colorscheme ayu]])
        vim.cmd([[
          highlight Normal guibg=none
          highlight NonText guibg=none
          highlight Normal ctermbg=none
          highlight NonText ctermbg=none
        ]])
    end,
}
