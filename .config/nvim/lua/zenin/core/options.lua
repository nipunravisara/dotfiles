vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
vim.o.completeopt = "menuone,noselect"

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- fold
vim.opt.foldmethod = "expr" -- Use expression-based folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Tree-sitter for fold computation
vim.opt.foldcolumn = "0" -- Narrow fold column like VS Code's gutter
vim.opt.foldnestmax = 10 -- Allow deeper folds (VS Code handles nested code well)
vim.opt.foldlevelstart = 99 -- Start with all folds open (VS Code default)
vim.opt.foldenable = true -- Enable folding
vim.opt.foldtext =
	[[substitute(getline(v:foldstart),'\\t\\| \\s*', '', 'g') . ' ... (' . (v:foldend - v:foldstart + 1) . ' lines)']] -- Clean fold text
