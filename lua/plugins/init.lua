return {
    -- Lazy.nvim setup
    {
        'rktjmp/lush.nvim', -- Required for rose-pine theme
        event = "VimEnter",
    },

    -- Prettier.nvim
    {
        'MunifTanjim/prettier.nvim',
        event = "BufRead",
    },

    -- None-ls (null-ls replacement)
    {
        'nvimtools/none-ls.nvim',
        event = "BufRead",
    },

    {
        'eandrju/cellular-automaton.nvim',
        event = "BufRead",
    },

    -- Telescope.nvim
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = "Telescope",
    },

    -- Rose Pine Theme
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd("colorscheme rose-pine-moon")
        end,
    },

    -- Nvim-Colorizer
    {
        'NvChad/nvim-colorizer.lua',
        event = "BufRead",
    },

    -- Nvim-Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },

    -- Nvim-Tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        cmd = "NvimTreeToggle",
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- LSP-Zero
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        },
    },

    -- Nvim-Comment
    {
        'terrortylor/nvim-comment',
        cmd = "CommentToggle",
    },

    -- Bufferline.nvim
    -- {
        --     'akinsho/bufferline.nvim',
        --     tag = "*",
        --     dependencies = 'nvim-tree/nvim-web-devicons',
        -- },

        -- Incline.nvim
        {
            'b0o/incline.nvim',
        },

        -- Lualine.nvim
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        },

        -- TailwindCSS Colorizer
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            config = function()
                require("tailwindcss-colorizer-cmp").setup({
                    color_square_width = 2,
                })
            end,
        },

        -- Lazygit.nvim
        {
            "kdheepak/lazygit.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
        },

        -- Harpoon
        {
            "ThePrimeagen/harpoon",
            branch = "harpoon2",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        -- Undotree
        {
            "jiaoshijie/undotree",
            dependencies = "nvim-lua/plenary.nvim",
            config = true,
        },

        -- Copilot
        {
            "github/copilot.vim",
        },

        -- Moveline
        {
            'willothy/moveline.nvim',
            build = 'make',
        },

        -- Rest.nvim
        {
            "rest-nvim/rest.nvim",
            dependencies = { { "nvim-lua/plenary.nvim" } },
            config = function()
                require("rest-nvim").setup({
                    --- Get the same options from Packer setup
                })
            end
        },
        { "folke/neodev.nvim", opts = {} },
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        }}
