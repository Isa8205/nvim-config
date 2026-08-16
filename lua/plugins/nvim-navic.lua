return {
  "SmiteshP/nvim-navic",
  opts = {
    icons = {
      File = "󰈙 ",
      Module = " ",
      Namespace = "󰌗 ",
      Package = " ",
      Class = "󰌗 ",
      Method = "󰆧 ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = "󰕘",
      Interface = "󰕘",
      Function = "󰊕 ",
      Variable = "󰆧 ",
      Constant = "󰏿 ",
      String = "󰀬 ",
      Number = "󰎠 ",
      Boolean = "◩ ",
      Array = "󰅪 ",
      Object = "󰅩 ",
      Key = "󰌋 ",
      Null = "󰟢 ",
      EnumMember = " ",
      Struct = "󰌗 ",
      Event = " ",
      Operator = "󰆕 ",
      TypeParameter = "󰊄 ",
      enabled = true,
    },
    lsp = {
      auto_attach = false,
      preference = nil,
    },
    highlight = false,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
      return text
    end,
  },
  config = function(_, opts)
    local navic = require "nvim-navic"
    navic.setup(opts)
    -- _G.navic_on_attach = function(client, bufnr)
    --   if client.server_capabilities.documentSymbolProvider then
    --     navic.attach(client, bufnr)
    --   end
    -- end
  end,
}
