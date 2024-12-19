return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			ui = {
				-- If you are using a Nerd Font: set icons to an empty table which will use the
				-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
				icons = vim.g.have_nerd_font and {} or {
					cmd = "⌘",
					config = "🛠",
					event = "📅",
					ft = "📂",
					init = "⚙",
					keys = "🗝",
					plugin = "🔌",
					runtime = "💻",
					require = "🌙",
					source = "📄",
					start = "🚀",
					task = "📌",
					lazy = "💤 ",
				},
			},
		})
	end,
}
