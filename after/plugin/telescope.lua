local builtin = require('telescope.builtin')
local binds = require("djor.binds")

vim.keymap.set('n', binds.telescope.find_files, function()
    vim.cmd("Telescope find_files hidden=true no_ignore=true")
end)

vim.keymap.set('n', binds.telescope.git_files, builtin.git_files, {})
vim.keymap.set('n', binds.telescope.grep_string, function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

