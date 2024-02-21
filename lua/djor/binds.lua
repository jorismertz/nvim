local telescope = require('telescope.builtin')
local utils = require('djor.utils')
local undotree = require('undotree')

local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}


-- Pane navigation movements
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

-- Miscelanious
keymap('n', "<leader>kk", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
keymap('n', "<leader>cb", utils.buf_kill, opts)
keymap('n', '<leader>ut', undotree.toggle, opts)

-- Telescope
keymap('n', '<leader>gf', telescope.git_files, {})
keymap('n', '<leader>pf', function()
    vim.cmd('Telescope find_files hidden=true no_ignore=true')
end)
keymap('n', '<leader>gs', function()
    telescope.grep_string({ search = vim.fn.input('Grep > ') })
end)

-- Exported binds for plugins
local binds = {
    lsp = {
        definition = 'gd',
        hover = 'K',
        workspace_symbol = '<leader>vws',
        open_float = '<leader>vd',
        goto_next = '[d',
        goto_prev = ']d',
        code_action = '<leader>vca',
        references = '<leader>vrr',
        rename = '<leader>vrn',
        signature_help = '<C-h>'
    },
    cmp = {
        select_prev_item = '<C-n>',
        select_next_item = '<C-m>',
        confirm = '<C-y>',
        complete = '<C-Space>'
    },
}

return binds
