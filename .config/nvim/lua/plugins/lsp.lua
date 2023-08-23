local setup, lsp = pcall(require, 'lsp-zero')
if not setup then
    return
end

local lsp_config_setup, lsp_config = pcall(require, 'lspconfig')
if not lsp_config_setup then
    return
end

lsp.preset({})
lsp.nvim_workspace()

-- (Optional) Configure lua language server for neovim
lsp_config.lua_ls.setup(lsp.nvim_lua_ls())

require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

lsp.setup()
