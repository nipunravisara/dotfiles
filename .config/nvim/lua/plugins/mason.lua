local setup, mason = pcall(require, "mason")
if not setup then
    return
end

local ensure_installed = {
    "tsserver",
    "eslint_d",
    "prettier",
    "cssmodules_ls",
    "emmet_ls",
    "html",
    "sumneko_lua",
    "typescript-language-server",
}

mason.setup({
    ensure_installed = ensure_installed,
})

