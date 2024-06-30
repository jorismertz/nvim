local options = {
	lsp = {
		hover = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		diagnostic_update_events = { "BufWritePost" },
	},
	buffers = {
		-- if set to true, the filetype of the otterbuffers will be set.
		-- otherwise only the autocommand of lspconfig that attaches
		-- the language server will be executed without setting the filetype
		set_filetype = true,
		-- write <path>.otter.<embedded language extension> files
		-- to disk on save of main buffer.
		-- usefule for some linters that require actual files
		-- otter files are deleted on quit or main buffer close
		write_to_disk = false,
	},
	-- strip_wrapping_quote_characters = { "'", '"', "`" },
	handle_leading_whitespace = true,
}

return {
	"jmbuhr/otter.nvim",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	event = "BufReadPre",
	config = function()
		local otter = require("otter")
		otter.setup(options)
		-- otter.activate(nil, true, true, nil)
	end,
}
