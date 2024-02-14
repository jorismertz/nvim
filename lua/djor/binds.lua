local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local harpoon = require("harpoon")
local utils = require("djor.utils")
local undotree = require("undotree")
local moveline = require('moveline')

vim.g.mapleader = " "

-- Selection movement
keymap('n', '<M-k>', moveline.up)
keymap('n', '<M-j>', moveline.down)
keymap('v', '<M-k>', moveline.block_up)
keymap('v', '<M-j>', moveline.block_down)


-- Pane navigation movements
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>k", opts)
keymap("n", "<C-;>", "<C-w>l", opts)

-- Miscelanious
keymap("n", "<leader>kk", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
keymap("n", "<leader>cb", utils.buf_kill, opts)
keymap('n', '<leader>ut', undotree.toggle, { noremap = true, silent = true })

keymap("n", "<leader>a", function() harpoon:list():append() end)
keymap("n", "<leader>op", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

keymap("n", "<C-u>", function() harpoon:list():select(1) end)
keymap("n", "<C-i>", function() harpoon:list():select(2) end)
keymap("n", "<C-o", function() harpoon:list():select(3) end)
keymap("n", "<C-p>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<C-S-P>", function() harpoon:list():prev() end)
keymap("n", "<C-S-N>", function() harpoon:list():next() end)


local binds = {
    lsp = {
        definition = "gd",
        hover = "K",
        workspace_symbol = "<leader>vws",
        open_float = "<leader>vd",
        goto_next = "[d",
        goto_prev = "]d",
        code_action = "<leader>vca",
        references = "<leader>vrr",
        rename = "<leader>vrn",
        signature_help = "<C-h>"
    },
    cmp = {
        select_prev_item = '<C-n>',
        select_next_item = '<C-m>',
        confirm = '<C-y>',
        complete = "<C-Space>"
    },
    nvimtree = {
        toggle = '<C-b>'
    },
    telescope = {
        find_files = '<leader>pf',
        git_files = '<leader>gf',
        grep_string = '<leader>gs',
    },
}

return binds
