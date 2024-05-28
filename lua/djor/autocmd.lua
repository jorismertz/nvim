vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    local ft = vim.bo.filetype
    if ft == "rust" then
      vim.cmd("RustFmt")
    end
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.j2",
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})
