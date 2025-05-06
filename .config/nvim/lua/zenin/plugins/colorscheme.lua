return {
	"ayu-theme/ayu-vim",
	priority = 1000,
	config = function()
		vim.g.ayucolor = "mirage"
		vim.cmd([[colorscheme ayu]])
	end,
}
