-- Extend LazyVim's conform config via opts
return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				javascript = { "prettierd", stop_after_first = true },
				javascriptreact = { "prettierd", stop_after_first = true },
				typescript = { "prettierd", stop_after_first = true },
				typescriptreact = { "prettierd", stop_after_first = true },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = { "mason-org/mason.nvim", "stevearc/conform.nvim" },
		opts = {
			ensure_installed = { "stylua", "prettierd", "clang-format" },
		},
	},
}
