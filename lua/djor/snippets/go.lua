local snippets = require('djor.snippets')
local M = {}

M.err_not_nil = function()
  return {
    'if err != nil {',
    '  return $1',
    '}',
  }
end

M.set_keymaps = function(opts)
  vim.keymap.set('n', '<leader>en', function()
    snippets.insert(M.err_not_nil())
  end, opts)
end

return M


