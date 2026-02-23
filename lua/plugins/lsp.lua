return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ast_grep",
					"html",
					"cssls",
					"ts_ls",
					"eslint",
					"clangd"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			vim.lsp.config('*', { capabilities = capabilities })
			--local lspconfig = require("lspconfig")
			--lspconfig.lua_ls.setup({})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("ast_grep", {
				cmd = { "ast_grep", "lsp" },
				filetypes = {
					"c",
					"cpp",
					"rust",
					"go",
					"java",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"kotlin",
					"dart",
					"lua",
				},
				root_dir = require("lspconfig.util").root_pattern("sgconfig.yaml", "sgconfig.yml"),
			})
			-- load lsps
			vim.lsp.enable({ "lua_ls", "ast_grep", "html", "cssls", "tsserver", "eslint", "clangd" })
			--diagnostic setup
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					format = function(diagnostic)
						return diagnostic.message
					end,
				},
				float = {
					border = "rounded",
					source = true,
				},
			})
		end,
	},
	--[[
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true, -- falls back to LSP formatting if no formatter found
				},
			})
		end,
	},
  --]]
}
