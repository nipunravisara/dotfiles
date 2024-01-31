local setup, catppuccin = pcall(require, "catppuccin/nvim")
if not setup then
    return
end

catppuccin.setup({
    transparent_background = not vim.g.neovide,
    idtegrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
    }
})
