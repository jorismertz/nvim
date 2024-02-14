local telescope = require('telescope.builtin')
local harpoon = require('harpoon')
local utils = require('djor.utils')
local undotree = require('undotree')
local moveline = require('moveline')
local nvimtree = require ( 'nvim-tree.api' )

local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}

vim.g.mapleader = ' '

-- Selection movement
keymap('n', '<M-k>', moveline.up)
keymap('n', '<M-j>', moveline.down)
keymap('v', '<M-k>', moveline.block_up)
keymap('v', '<M-j>', moveline.block_down)

-- Pane navigation movements
keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)

-- Miscelanious
keymap('n', "<C-b>", nvimtree.tree.toggle)
keymap('n', "<leader>kk", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
keymap('n', "<leader>cb", utils.buf_kill, opts)
keymap('n', '<leader>ut', undotree.toggle, opts)

-- Harpoon
keymap('n', "<leader>a", function()
    harpoon:list():append()
end)
keymap('n', "<leader>op", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap('n', "<M-y>", function()
    harpoon:list():select(1)
end)
keymap('n', "<M-u>", function()
    harpoon:list():select(2)
end)
keymap('n', "<M-i>", function()
    harpoon:list():select(3)
end)
keymap('n', "<M-o>", function()
    harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
keymap('n', "<C-S-P>", function()
    harpoon:list():prev()
end)
keymap('n', "<C-S-N>", function()
    harpoon:list():next()
end)

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
