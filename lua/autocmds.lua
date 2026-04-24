vim.cmd "set nowrap"
vim.cmd "set nu"
vim.cmd "set noequalalways" -- Prevent the panes from resizing upon closing one.
vim.cmd "set sessionoptions-=winsize"

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b3b3b" })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function ()
    vim.treesitter.start()
  end
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function ()
    vim.cmd("filetype detect")
  end
})
