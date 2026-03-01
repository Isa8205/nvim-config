return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    -- UFO requires these specific Neovim settings to function like VS Code
    vim.o.foldcolumn = "1" -- Show the fold column
    vim.o.foldlevel = 99 -- Start with all folds open (standard VS Code behavior)
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true -- Enable folding
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]] -- Modern arrows

    -- Setup UFO with LSP (granular) and Treesitter (fallback)
    require("ufo").setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" } -- Use LSP for accurate function/class detection
      end,
    }

    -- Keybindings
    local k = vim.keymap.set
    local ufo = require "ufo"

    -- 1. Toggle only the current function/class under cursor
    k("n", "za", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.cmd "normal! za" -- Fallback to standard toggle if no ufo preview
      end
    end, { desc = "Toggle current fold" })

    -- 2. "Focus Mode": Close all folds EXCEPT the one you are in
    k("n", "zf", "zMzv", { desc = "Close all folds except current block" }) --

    -- 3. Open All / Close All (The "Panic" buttons)
    k("n", "zR", ufo.openAllFolds, { desc = "Open all folds" }) --
    k("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" }) --
  end,
}
