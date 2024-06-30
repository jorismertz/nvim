vim.g.mapleader = " "

require("djor.lazy")
require("djor.set")
require("djor.binds")
require("djor.autocmd")

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
	},
})
