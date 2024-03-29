return {
  'VonHeikemen/lsp-zero.nvim',
  event = "BufRead",
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },             -- Required
    { 'williamboman/mason.nvim' },           -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    { 'hrsh7th/nvim-cmp' },                  -- Required
    { 'hrsh7th/cmp-nvim-lsp' },              -- Required
    { 'L3MON4D3/LuaSnip' },                  -- Required
    { "folke/neodev.nvim",                     opts = {} },
    { "roobert/tailwindcss-colorizer-cmp.nvim" },
  },
  config = function()
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

    lspconfig.htmx.setup {
      filetypes = { 'html', 'htmldjango' }
    }

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      [binds.cmp.select_prev_item] = cmp.mapping.select_prev_item(cmp_select),
      [binds.cmp.select_next_item] = cmp.mapping.select_next_item(cmp_select),
      [binds.cmp.confirm] = cmp.mapping.confirm({ select = true }),
      [binds.cmp.complete] = cmp.mapping.complete(),
    })

    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })

    cmp.config.formatting = {
      format = require("tailwindcss-colorizer-cmp").formatter
    }
    cmp_mappings['<Tab>'] = nil
    cmp_mappings['<S-Tab>'] = nil

    lsp.setup_nvim_cmp({ mapping = cmp_mappings })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set('n', binds.lsp.definition, vim.lsp.buf.definition, opts)
      vim.keymap.set('n', binds.lsp.hover, vim.lsp.buf.hover, opts)
      vim.keymap.set('n', binds.lsp.workspace_symbol, require 'telescope.builtin'.lsp_workspace_symbols, opts)
      vim.keymap.set('n', binds.lsp.references, require 'telescope.builtin'.lsp_references, opts)
      vim.keymap.set('n', binds.lsp.open_float, vim.diagnostic.open_float, opts)
      vim.keymap.set('n', binds.lsp.goto_next, vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', binds.lsp.goto_prev, vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', binds.lsp.code_action, vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', binds.lsp.rename, vim.lsp.buf.rename, opts)
      vim.keymap.set('i', binds.lsp.signature_help, vim.lsp.buf.signature_help, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true
    })
  end
}
