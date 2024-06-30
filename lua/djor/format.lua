local conform = require("conform")
local otter = require("otter")
local utils = require("djor.utils")

local M = {}

function M.format_buff(bufnr)
	local bufnr = bufnr or vim.api.nvim_get_current_buf()

	otter.ask_format(utils.wrap_fn(conform.format, { { async = true, lsp_format = "fallback", bufnr = bufnr } }))
	-- conform.format({ async = true, lsp_format = "fallback", range = range, bufnr = bufnr })
end

return M
