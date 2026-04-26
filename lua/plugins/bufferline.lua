return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostic = "coc",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,
      mode = "buffers",
      separator_style = "slant", -- Can be "slant", "thick", "thin", etc.
      always_show_bufferline = true, -- Keep visible even with one file
      show_buffer_close_icons = true,
      show_close_icon = true,
      custom_filter = function(bufnr)
        if vim.bo[bufnr].buftype == "terminal" then
          return false
        end
        return true
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    local keymap = vim.keymap

    keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer (filtered)" })
    keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer (filtered)" })
  end,
}
