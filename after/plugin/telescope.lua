local builtin = require('telescope.builtin')
local binds = require("djor.binds")

vim.keymap.set('n', binds.telescope.find_files, builtin.find_files, {})
vim.keymap.set('n', binds.telescope.git_files, builtin.git_files, {})
vim.keymap.set('n', binds.telescope.grep_string, function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
