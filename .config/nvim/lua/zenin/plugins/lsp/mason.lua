return {
    "williamboman/mason.nvim",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()
        local default_lsp_servers = {
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "lua_ls",
            "graphql",
            "emmet_ls",
            "pyright",
        }
        local default_lsp_tools = {
            "prettier",
            "stylua",
            "isort",
            "black",
            "pylint",
            "eslint_d",
        }

        -- Setup mason
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- Configure mason-lspconfig to handle LSP servers
        mason_lspconfig.setup({
            automatic_enable = true,
            ensure_installed = default_lsp_servers,
            automatic_installation = true,
        })

        -- Configure mason-tool-installer for additional tools
        mason_tool_installer.setup({
            ensure_installed = default_lsp_tools,
            auto_update = true,
            run_on_start = true,
        })

        -- Configure LSP servers
        for _, server_name in ipairs(default_lsp_servers) do
            local server_config = {
                on_attach = mason_lspconfig.on_attach,
                capabilities = capabilities,
            }

            -- Custom configuration for specific servers
            if server_name == "graphql" then
                server_config.filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" }
            elseif server_name == "pyright" then
                server_config.filetypes = {
                    "python",
                }
            elseif server_name == "emmet_ls" then
                server_config.filetypes = {
                    "html",
                    "typescriptreact",
                    "javascriptreact",
                    "css",
                    "sass",
                    "scss",
                    "less",
                }
            elseif server_name == "lua_ls" then
                server_config.settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                                "require",
                            },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                }
            end
            lspconfig[server_name].setup(server_config)
        end
    end,
}
