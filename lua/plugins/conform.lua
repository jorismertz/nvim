return {
  'stevearc/conform.nvim',
  event = "BufRead",
  config = function()
    require('conform').setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { "rustywind", { "prettierd", "prettier", } },
        go = { "gofumpt" },
        markdown = { "markdownlint" },
        python = { "ruff_format" },
        rust = { "rustfmt" },
      },
      formatters = {
        rustfmt = {
          prepend_args = { "--edition", "2021" }
        }
      }
    })
  end
}
