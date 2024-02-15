require('neodev').setup({})

local lsp = require('lsp-zero')
local binds = require('djor.binds')

lsp.preset('recommended')
lsp.ensure_installed({
    'tsserver',
 })

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace'
      }
    }
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    [binds.cmp.select_prev_item] = cmp.mapping.select_prev_item(cmp_select),
    [binds.cmp.select_next_item] = cmp.mapping.select_next_item(cmp_select),
    [binds.cmp.confirm] = cmp.mapping.confirm({ select = true }),
    [binds.cmp.complete] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', binds.lsp.definition, vim.lsp.buf.definition, opts)
    vim.keymap.set('n', binds.lsp.hover, vim.lsp.buf.hover, opts)
    vim.keymap.set('n', binds.lsp.workspace_symbol, vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', binds.lsp.open_float, vim.diagnostic.open_float, opts)
    vim.keymap.set('n', binds.lsp.goto_next, vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', binds.lsp.goto_prev, vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', binds.lsp.code_action, vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', binds.lsp.references, vim.lsp.buf.references, opts)
    vim.keymap.set('n', binds.lsp.rename, vim.lsp.buf.rename, opts)
    vim.keymap.set('i', binds.lsp.signature_help, vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

