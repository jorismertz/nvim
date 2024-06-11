---@class AskamaConfig
---@field source_file_ext string|nil
---@field target_filetype string|nil
---@field treesitter_parser string|nil

local M = {}

---@type AskamaConfig
M.config = nil

---@type AskamaConfig
M.defaults = {
	source_file_ext = "html",
	target_filetype = "jinja",
	treesitter_parser = "htmldjango",
}

---@private
function M:is_askama()
	local cargo_toml = vim.fn.glob("Cargo.toml")
	return vim.fn.len(cargo_toml) ~= 0
end

function M:merge_defaults(config)
	self.config = vim.tbl_extend("force", self.defaults, config)
end

---@param opts AskamaConfig
function M:setup(opts)
	self:merge_defaults(opts)

	vim.filetype.add({
		pattern = {
			[".*/templates/.*%." .. self.config.source_file_ext] = self.config.target_filetype,
		},
	})

	vim.treesitter.language.register(self.config.treesitter_parser, self.config.target_filetype)

	vim.api.nvim_create_autocmd("BufRead", {
		pattern = "**/templates/*." .. self.config.source_file_ext,
		callback = function()
			if self:is_askama() then
				vim.bo.filetype = self.config.target_filetype
			end
		end,
	})
end

return M
