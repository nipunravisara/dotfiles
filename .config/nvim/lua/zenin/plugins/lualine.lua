return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local onedark = require("lualine.themes.onedark")

        onedark.normal.bg = "None"

        lualine.setup({
            options = {
                theme = onedark,
                component_separators = { left = "", right = "" },
                section_separators = { left = " ", right = " " },
                globalstatus = true,
            },

            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            return "⚡️" .. str
                        end,
                    },
                },
                lualine_b = { "branch", "diff" },
                lualine_x = { "diagnostics" },
                lualine_z = { "lsp_status" },
            },
        })
    end,
}
