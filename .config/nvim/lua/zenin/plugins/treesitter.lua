return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- The archived master branch registers its custom query predicates and
		-- directives with the pre-0.11 single-node match format (`all = false`),
		-- which Neovim 0.12 removed: handlers now always receive a list of nodes
		-- per capture. Without this shim, parsing any buffer whose queries use
		-- them (e.g. markdown code fences via #set-lang-from-info-string!) fails
		-- with "attempt to call method 'range' (a nil value)".
		if vim.fn.has("nvim-0.12") == 1 then
			require("zenin.treesitter-compat").fix_query_predicates()
		end

		-- autotagging is configured via nvim-ts-autotag's own setup
		require("nvim-ts-autotag").setup()

		-- configure treesitter
		treesitter.setup({
			modules = {},
			auto_install = true,
			sync_install = true,
			ignore_install = {},
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
				"python",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			--enable highlight
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
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
