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

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

-- TypeScript
lsp_config.tsserver.setup {
    on_attach = enable_format_on_save,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
}

require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

lsp.setup()
