require("configs.lazy")

-- Replace the text diagnostics with glyphs
local signs = {
  Error = "",
  Warn  = "",
  Info  = "",
  Hint  = "󰌵",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = hl, -- optional: also color the line number
  })
end

vim.filetype.add({
  extension = {
    asm = "nasm",
    prisma = "prisma",
  }
})

require("autocmds")
require("mappings")
require("options")
require("configs.vim")
