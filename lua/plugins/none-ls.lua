return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                -- Javascript and ts
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.eslint_d,
                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- c#
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.ast_grep,
                -- Assembly
                null_ls.builtins.formatting.asmfmt
			},
		})

		vim.keymap.set(
			"n",
			"<leader>gf",
			vim.lsp.buf.format,
			{ desc = "Format current buffer via the given formatter" }
		)
	end,
}
