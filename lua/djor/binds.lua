local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>k", opts)
keymap("n", "<C-;>", "<C-w>l", opts)


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
    }
}

return binds
