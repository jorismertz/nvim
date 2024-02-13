local lsp = require("lsp-zero")
local binds = require("djor.binds")

lsp.preset("recommended")

lsp.ensure_installed({'tsserver'})

-- -- Fix Undefined global 'vim'
-- lsp.configure('lua-language-server', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = {'vim'}
--             }
--         }
--     }
-- })

require'lspconfig'.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    library = {vim.env.VIMRUNTIME}
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            })

            client.notify("workspace/didChangeConfiguration", {
                settings = client.config.settings
            })
        end
        return true
    end
}

local cmp = require('cmp')
local cmp_select = {
    behavior = cmp.SelectBehavior.Select
}
local cmp_mappings = lsp.defaults.cmp_mappings({
    [binds.cmp.select_prev_item] = cmp.mapping.select_prev_item(cmp_select),
    [binds.cmp.select_next_item] = cmp.mapping.select_next_item(cmp_select),
    [binds.cmp.confirm] = cmp.mapping.confirm({
        select = true
    }),
    [binds.cmp.complete] = cmp.mapping.complete()
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false
    }

    vim.keymap.set("n", binds.lsp.definition, function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", binds.lsp.hover, function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", binds.lsp.workspace_symbol, function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", binds.lsp.open_float, function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", binds.lsp.goto_next, function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", binds.lsp.goto_prev, function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", binds.lsp.code_action, function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", binds.lsp.references, function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", binds.lsp.rename, function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", binds.lsp.signature_help, function()
        vim.lsp.buf.signature_help()
    end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

