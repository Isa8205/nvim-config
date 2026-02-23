return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = true,
            highlight = { enabled = true },
            indent = { endabled = true }
        },
		branch = "master",
        lazy = false,
        build = ":TSUpdate",
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
		priority = 1000,
	},

	{
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
	},
	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
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
			vim.opt.sessionoptions:append("globals")
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
	},
}
