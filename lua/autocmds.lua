vim.cmd "set nowrap"
vim.cmd "set nu"
vim.cmd "set noequalalways" -- Prevent the panes from resizing upon closing one.
vim.cmd "set sessionoptions-=winsize"

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b3b3b" })

vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = "#587c0c" })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#d7ba7d" })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#f44747" })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#587c0c" })
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#5c6370", italic = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "prisma",
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.cmd "filetype detect"
  end,
})
