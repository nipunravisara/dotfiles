return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			background = {
				dark = "mocha",
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				mason = true,
				telescope = {
					enabled = true,
				},
			},
			transparent_background = true,
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
