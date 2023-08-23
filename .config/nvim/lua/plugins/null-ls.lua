local setup, null_ls = pcall(require, "null_ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.prettier,
        diagnostics.eslint,
        completion.spell,
    },
})
