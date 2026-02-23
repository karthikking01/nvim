return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "mason.nvim", "nvimtools/none-ls-extras.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = { "mason.nvim", "nvimtools/none-ls.nvim" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "prettierd", "clang-format" },
				automatic_installation = true,
			})
		end,
	},
}
