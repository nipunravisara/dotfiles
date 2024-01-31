local mason_setup, mason = pcall(require, "mason")
if not mason_setup then
  return
end

local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_setup then
  return
end


local ensure_installed = {
  "bashls",
  "html",
  "cssls",
  "cssmodules_ls",
  "tsserver",
  "eslint_d",
  "prettier",
  "emmet_ls",
  "lua_ls",
  "typescript-language-server",
}

mason.setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
})
mason_lspconfig.setup()
