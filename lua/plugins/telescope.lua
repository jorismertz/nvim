return {
  {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    cmd = "Telescope",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup {
        defaults = {
          layout_config = {
            vertical = { width = 0.5 }
          },
        },
      }
    end
  },
}
