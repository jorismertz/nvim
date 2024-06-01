return {
  {
    'eandrju/cellular-automaton.nvim',
    event = "BufRead",
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