vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true
vim.o.completeopt = "menuone,noselect"

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- stop code wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = false

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- handle undo
-- opt.swapfile = false
-- opt.backup = false
-- opt.undodir = os.getenv("HOME") .. ".vim/undodir"
-- opt.undofile = true

-- space from bottom
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "0"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- fold
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldnestmax = 10
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldtext =
    [[substitute(getline(v:foldstart),'\\t\\| \\s*', '', 'g') . ' ... (' . (v:foldend - v:foldstart + 1) . ' lines)']]
