-- LazyVim manages mason, mason-lspconfig, and nvim-lspconfig.
-- Extend them here using opts instead of re-calling setup().
return {
	-- Let mason-lspconfig auto-install servers declared in nvim-lspconfig opts.servers
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"ts_ls",
				"eslint",
				"clangd",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			-- Diagnostic display
			diagnostics = {
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
			},

			-- Server configurations; LazyVim feeds these into lspconfig[server].setup()
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
						},
					},
				},
				html = {},
				cssls = {},
				ts_ls = {},
				eslint = {},
				clangd = {},

				-- ast_grep with custom root_dir (require deferred to avoid eager load at spec-parse time)
				ast_grep = {
					cmd = { "ast_grep", "lsp" },
					filetypes = {
						"c", "cpp", "rust", "go", "java", "python",
						"javascript", "typescript", "html", "css",
						"kotlin", "dart", "lua",
					},
					root_dir = function(fname)
						return require("lspconfig.util").root_pattern("sgconfig.yaml", "sgconfig.yml")(fname)
					end,
				},
			},
		},
	},
}
