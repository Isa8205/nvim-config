keymap = vim.keymap

keymap.set("i", "jk", "<Esc>")

-- Reloading entire config
keymap.set("n", "<leader>rr", ":source $MYVIMRC | echo 'Config Reloaded!'<CR>")

-- File save
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save a file" })

-- Utility hacks and navigation
keymap.set("n", ";", ":", { desc = "Enter command mode ready for a prompt" })

-- Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap.set("n", "<M-k>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<M-j>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<M-l>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<M-h>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Terminal navigation and creation
keymap.set("n", "<leader>t", ":term<CR>i", { desc = "Terminal in current pane" })
keymap.set("n", "<leader>th", function()
    vim.cmd("botright split")     -- Create split at the very bottom
    vim.cmd("resize 15")          -- Set a fixed height (adjust as needed)
    vim.cmd("term")               -- Open terminal
    vim.cmd("startinsert")        -- Auto-focus into typing mode
end, { desc = "Terminal bottom split" })

keymap.set("n", "<leader>tv", function()
    vim.cmd("botright vsplit")    -- Create split at the far right
    vim.cmd("vertical resize 60") -- Set a fixed width
    vim.cmd("term")               -- Open terminal
    vim.cmd("startinsert")        -- Auto-focus into typing mode
end, { desc = "Terminal right split" })

-- Exit terminal mode with Esc and jk
keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = "Exit terminal mode" })
