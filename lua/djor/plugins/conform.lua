return {
	"stevearc/conform.nvim",
	event = "BufRead",
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			typescriptreact = { "rustywind", { "prettierd", "prettier" } },
			go = { "gofumpt" },
			markdown = { "markdownlint" },
			python = { "ruff_format" },
			rust = { "rustfmt" },
			handlebars = { "prettier" },
			toml = { "taplo" },
		},
		formatters = {
			taplo = {
				command = "taplo",
				args = { "fmt", "--option", "align_entries=true", "$FILENAME" },
				stdin = false,
			},
		},
	},
}
