vim.g.mapleader = ' '

require("djor.lazy")
require("djor.set")
require("djor.binds")
require("djor.autocmd")

require("djor.modules.askama"):setup({
  target_filetype = "handlebars",
})

vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
