-- Imports
local telescope_builtin_setup, telescope_builtin = pcall(require, 'telescope.builtin')
if not telescope_builtin_setup then
    return
end

local lsp_setup, lsp = pcall(require, 'lsp-zero')
if not lsp_setup then
    return
end

local cmp_setup, cmp = pcall(require, 'cmp')
if not cmp_setup then
    return
end

local keymap = vim.keymap

-- LSP-cmp
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Return>'] = cmp.mapping.confirm({ select = true }),
})

-- LSP-buffer
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gn", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "gp", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "hh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "rr", function() vim.lsp.buf.references() end, opts)
end)

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- Set leader key
vim.g.mapleader = " "

-- Vim
keymap.set("n", "<leader>ee", vim.cmd.Ex)
keymap.set("n", "<leader>p", vim.cmd.UltiSnipsExpandTrigger)

-- Telescope
keymap.set("n", "<leader>ff", telescope_builtin.find_files, {})
keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})

-- Undotree
keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle)

-- Nvim tree
keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)
