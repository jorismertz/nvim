return {
  {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          layout_config = {
            vertical = { width = 0.5 }
          },
        },
      })

      local builtin = require('telescope.builtin')
      -- Telescope
      local function find_files()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
        })
      end

      local function git_files()
        builtin.git_files({
          show_untracked = true,
        })
      end

      local function live_grep()
        builtin.live_grep({
          hidden = true,
          no_ignore = true,
        })
      end

      local keymap = vim.keymap.set
      local opts = {
        noremap = true,
        silent = true
      }

      keymap('n', '<leader>pf', git_files, opts)
      keymap('n', '<leader>af', find_files, opts)
      keymap('n', '<leader>gs', live_grep, opts)
      keymap('n', '<leader>rf', telescope.lsp_references, opts)
      keymap('n', '<leader>gc', telescope.git_commits, opts)
      keymap('n', '<leader>ts', telescope.treesitter, opts)
    end
  },
}
