return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.buttons.val = {
      dashboard.button('e', 'New file'),
      dashboard.button('<leader>pf', 'Find File'),
      dashboard.button('<leader>gs', 'Find word'),
      dashboard.button('<leader>op', 'Harpoon Bookmarks'),
      dashboard.button('<leader>pr', 'Trouble open diagnostics'),
    }

    alpha.setup(dashboard.config)
  end
}
