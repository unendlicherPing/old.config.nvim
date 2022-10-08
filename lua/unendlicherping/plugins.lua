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
    }

    -- Themes
    use {
        -- tokyonight
        'folke/tokyonight.nvim',

        -- Nord
        'arcticicestudio/nord-vim',

        -- Intellij
        'chiendo97/intellij.vim',

        -- Monokay
        'sickill/vim-monokai',
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
        },

        -- noice.nvim
        {
          "folke/noice.nvim",
          event = "VimEnter",
          config = function()
            require("noice").setup()
          end,
          requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "hrsh7th/nvim-cmp",
            }
        },

        -- winbar
        { 'fgheng/winbar.nvim' },

        -- tabby
        'nanozuki/tabby.nvim',
    }


    use {
        'unendlicherPing/very-important-plugin.nvim',
    }

    -- discord rpc
    use 'andweeb/presence.nvim'
    -- which key
    use 'folke/which-key.nvim'

    -- vim be good
    use { 
        'ThePrimeagen/vim-be-good',
        opt = true,
        cmd = { "VimBeGood" },
    }

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
