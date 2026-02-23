return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "thin", -- Can be "slant", "thick", "thin", etc.
      always_show_bufferline = true, -- Keep visible even with one file
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
  config = function()
    require("bufferline").setup()
    local keymap = vim.keymap

    keymap.set("n", "<tab>", "<cmd>bn<CR>", { desc = "Move to the next open buffer" })
    keymap.set("n", "<S-tab>", "<cmd>bp<CR>", { desc = "Move to the previous open buffer" })
  end,
}
