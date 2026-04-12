return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/Projects/*",
      "~/Documents/Github/*",
      "~/Unity projects/*",
    },
    picker = {
      type = "telescope",
    },
  },
  init = function()
    vim.opt.sessionoptions:append "globals"
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "Shatur/neovim-session-manager" },
  },
  config = function(_, opts)
    require("neovim-project").setup(opts)

    local keymap = vim.keymap
    keymap.set("n", "<C-p>", "<cmd>NeovimProjectDiscover history<CR>")
    keymap.set("n", "<C-p>h", "<cmd>NeovimProjectHistory<CR>")
  end,
  lazy = false,
  priority = 100,
}
