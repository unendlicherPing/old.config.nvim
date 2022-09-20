local packer_bootstrap = require('unendlicherping.ensure_packer').ensure_packer()
local packer = require('packer')

local function plugins(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        -- Telescope Core
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
            },
        },

        -- Telescope File Browser
        'nvim-telescope/telescope-file-browser.nvim',

        -- fzf
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
        },
    }

    -- Language Services
    use {
        -- Neo Vim LSP - Config
        'neovim/nvim-lspconfig',

        -- Neo Vim LSP Installer
        'williamboman/nvim-lsp-installer',

        -- Treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            run = 'TSUpdate',
        },

        -- Code Completion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                { 'hrsh7th/cmp-nvim-lsp', opt = true },
                { 'hrsh7th/cmp-buffer', opt = true },
                { 'hrsh7th/cmp-path', opt = true },
                { 'hrsh7th/cmp-cmdline', opt = true },
            },
        },
    }

    -- Themes
    use {
        -- tokyonight
        'folke/tokyonight.nvim',

        -- Nord
        'shaunsingh/nord.nvim',

        -- Intellij
        'chiendo97/intellij.vim',
    }

    -- UI
    use {
        -- dashboard
        'glepnir/dashboard-nvim',

        -- Floaterm
        'voldikss/vim-floaterm',

        -- Lualine
        {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
    }


    use {
        'unendlicherPing/very-important-plugin.nvim',
    }

    -- which key
    use 'folke/which-key.nvim'

    -- vim be good
    use 'ThePrimeagen/vim-be-good'

    if packer_bootstrap then
        packer.sync()
    end
end

local config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}

packer.startup({ plugins, config = config })

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
