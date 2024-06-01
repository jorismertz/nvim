vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("djor.set")
require("lazy").setup('plugins')
require("djor.binds")
-- require("djor.incr")
require("djor.autocmd")

local askama = require("djor.askama")
askama:setup({
  source_file_ext = "html",
  target_filetype = "handlebars",
  treesitter_parser = "htmldjango",
})

vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
