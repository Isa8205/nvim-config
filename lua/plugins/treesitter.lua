return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    highlight = { enabled = true },
    indent = { endabled = true },
  },
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
}
