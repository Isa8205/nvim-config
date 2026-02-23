return {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

        source_selector = {
          winbar = true,
          statusline = false,
          content_layout = "center",
          tabs_layout = "equal",
          sources = {
            { source = "filesystem", display_name = "  Files " },
            { source = "buffers",    display_name = "  Buffers " },
            { source = "git_status", display_name = "  Git " },
          },
        },

        default_component_configs = {
          container = {
            enable_character_fade = true,
          },

          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
          },

          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            default = "󰈚",
          },

          modified = {
            symbol = "●",
            highlight = "NeoTreeModified",
          },

          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
        },

        filesystem = {
          bind_to_cwd = true,
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },

          use_libuv_file_watcher = true,

          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        },

        -- ===== Buffers source =====
        buffers = {
          follow_current_file = {
            enabled = true,
          },
          group_empty_dirs = true,
          show_unloaded = true,
        },

        -- ===== Git source =====
        git_status = {
          window = {
            position = "float",
          },
        },
      })

      -- Custom keymaps
			local keymap = vim.keymap

			keymap.set("n", "<leader>e", "<cmd>Neotree<CR>", { desc = "Focus the file explorer" })
			keymap.set("n", "<C-n>", "<cmd>Neotree<CR>")
			keymap.set("n", "<C-n>c", "<cmd>Neotree close<CR>")
			keymap.set("n", "<C-n>s", "<cmd>Neotree show<CR>")
    end,
	}
