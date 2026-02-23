vim.cmd("set nowrap")
vim.cmd("set nu")

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#2a2e36" }) -- Dim grey

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
