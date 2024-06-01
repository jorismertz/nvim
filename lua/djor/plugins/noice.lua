return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      lsp = {
        hover = {
          enabled = false
        },
        signature = {
          enabled = false
        },
        presets = {
          long_message_to_split = true,
          lsp_doc_border = true,
        },
      }
    })
  end
}
