local telescope = require('telescope.builtin')
local utils = require('djor.utils')
local undotree = require('undotree')
local check = require("djor.check")

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

-- Yank to system clipboard
keymap('n', "<leader>y", '"+y', opts)

-- Miscelanious
keymap('n', "<leader>pr", "<cmd>TroubleToggle<CR>", opts)
keymap('n', "<leader>kk", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
keymap('n', '<C-c>', check.toggle_checkbox, opts)
keymap('n', "<leader>cb", utils.buf_kill, opts)
keymap('n', '<leader>ut', undotree.toggle, opts)

-- Telescope
local function find_files()
  telescope.find_files({
    hidden = true,
    no_ignore = true,
  })
end

local function git_files()
  telescope.git_files({
    show_untracked = true,
  })
end

local function live_grep()
  telescope.live_grep({
    hidden = true,
    no_ignore = true,
  })
end

local function yank_history()
  require('telescope').extensions.yank_history.yank_history({})
end

keymap('n', '<leader>pf', git_files)
keymap('n', '<leader>af', find_files)
keymap('n', '<leader>gs', live_grep)
keymap('n', '<leader>gc', telescope.git_commits)
keymap('n', '<leader>ts', telescope.treesitter)
keymap('n', '<leader>pp', yank_history)

-- Yanky
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

require('leap').create_default_mappings()

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
    select_prev_item = '<C-p>',
    select_next_item = '<C-n>',
    confirm = '<C-y>',
    complete = '<C-Space>'
  },
}

return binds
