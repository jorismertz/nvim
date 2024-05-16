return {
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require('alpha.themes.dashboard')

      dashboard.section.buttons.val = {
        dashboard.button('e', 'New file'),
        dashboard.button('<leader>pf', 'Find File'),
        dashboard.button('<leader>gs', 'Find word'),
        dashboard.button('<leader>op', 'Harpoon Bookmarks'),
      }

      alpha.setup(dashboard.config)
    end
  },
  {
    'eandrju/cellular-automaton.nvim',
    event = "BufRead",
  },

  -- Telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup {}
    end
  },

  -- Rose Pine Theme
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      -- These 2 lines allow for a transparant background
      require('rose-pine').setup({
        variant = 'moon',
        dim_inactive_windows = false,
        styles = {
          transparency = true
        }
      })

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.cmd("hi Normal guibg=none ctermbg=none")
      vim.cmd("colorscheme rose-pine-moon")
    end,
  },

  -- Nvim-Colorizer
  {
    'NvChad/nvim-colorizer.lua',
    event = "BufRead",
    config = function()
      require 'colorizer'.setup({})
    end
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {},
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },

  -- Copilot
  {
    "github/copilot.vim",
    event = "BufRead"
  },

  -- Moveline
  {
    'willothy/moveline.nvim',
    event = "VeryLazy",
    build = 'make',
    config = function()
      local moveline = require('moveline')

      vim.keymap.set('n', '<M-k>', moveline.up)
      vim.keymap.set('n', '<M-j>', moveline.down)
      vim.keymap.set('v', '<M-k>', moveline.block_up)
      vim.keymap.set('v', '<M-j>', moveline.block_down)
    end
  },

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {}
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
    config = function()
      require('nvim-autopairs').setup({})
    end
  },
  -- Leap.vim
  {
    'https://github.com/ggandor/leap.nvim',
    event = "VeryLazy",
    dependencies = {
      'https://github.com/tpope/vim-repeat'
    },
    config = function()
      require('leap').create_default_mappings()
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
