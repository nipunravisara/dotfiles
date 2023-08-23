local setup, lualine = pcall(require, "lualine")
if not setup then
    return
end

lualine.setup({
    options = {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    }
})

