return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- The Installer
      "williamboman/mason-lspconfig.nvim", -- The Bridge
    },
    config = function()
      local lspconfig = vim.lsp

      -- Setup Mason-LSPConfig to ensure servers are installed
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "omnisharp" },
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.enable("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
        on_attach = navic_on_attach,
        capabilities = capabilities,
      })
      lspconfig.enable("pyright", {
        capabilities = capabilities,
        on_attach = navic_on_attach,
      })
      lspconfig.enable("ts_ls", {
        capabilities = capabilities,
        on_attach = navic_on_attach,
      })
      lspconfig.enable("clangd", {
        capabilities = capabilities,
        on_attach = navic_on_attach,
      })
      lspconfig.enable("omnisharp", {
        capabilities = capabilities,
        on_attach = navic_on_attach,
      })

      local keymap = vim.keymap
      keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to declaration point" })
      keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to definition point" })
      keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      keymap.set("n", "K", function()
        vim.lsp.buf.hover { border = "rounded", max_height = 25, max_width = 120 }
      end, { desc = "Display infor about symbol under cursor" })
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Display the code actions" })
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename alll occurences of the symbol under cursor" })
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended for NvChad/Lazy users
    ft = { "rust" },
  },
}
