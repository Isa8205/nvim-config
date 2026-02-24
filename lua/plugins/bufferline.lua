return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
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
