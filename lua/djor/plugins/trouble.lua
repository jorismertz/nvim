return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>pr",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
  },
  opts = {
    focus = true,
    warn_no_results = false,
    open_no_results = true
  },
}
