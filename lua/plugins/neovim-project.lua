return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/Projects/*",
      "~/Documents/Github/*",
    },
    picker = {
      type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
    },
  },
  init = function()
    vim.opt.sessionoptions:append "globals"
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  config = function()
    require("neovim-project").setup()

    local keymap = vim.keymap
    keymap.set("n", "<C-p>", "<cmd>NeovimProjectDiscover history<CR>")
    keymap.set("n", "<C-p>h", "<cmd>NeovimProjectHistory<CR>")
  end,
  lazy = false,
  priority = 100,
}
