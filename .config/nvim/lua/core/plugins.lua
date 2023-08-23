local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                  -- package manager
    use 'nvim-tree/nvim-tree.lua'                 -- file explorer
    use 'nvim-tree/nvim-web-devicons'             -- file icons
    use 'mbbill/undotree'                         -- manage undo history
    use 'nvim-lualine/lualine.nvim'               -- status bar
    use 'williamboman/mason-lspconfig.nvim'
    use 'morgsmccauley/vim-react-native-snippets' -- react-native-snippets
    use 'SirVer/ultisnips'                        -- react ts snippets
    use 'mlaursen/vim-react-snippets'             -- react ts snippets
    use 'neoclide/vim-jsx-improve'                -- jsx support
    use 'windwp/nvim-ts-autotag'                  -- auto tags
    use 'windwp/nvim-autopairs'                   --  auto pairs
    use 'jose-elias-alvarez/null-ls.nvim'         -- formatter util
    use 'lewis6991/gitsigns.nvim'                 -- git signs
    use { "catppuccin/nvim", as = "catppuccin" }  -- color theme
    use {
        'williamboman/mason.nvim',                -- updates registry contents
        run = ":MasonUpdate"
    }
    use {
        "nvim-treesitter/nvim-treesitter", -- syntac highlight
        run = ':TSUpdate'
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2', -- fuzzy finder
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'VonHeikemen/lsp-zero.nvim', -- lsp setup
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' }, -- lsp support
            { 'hrsh7th/nvim-cmp' },      -- autocompletion
            { 'hrsh7th/cmp-nvim-lsp' },  -- autocompletion
            { 'L3MON4D3/LuaSnip' },      -- autocompletion
        }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
