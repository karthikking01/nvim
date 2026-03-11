-- Extend LazyVim's treesitter config via opts
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"c", "lua", "vim", "vimdoc", "query", "javascript", "html",
		},
	},
}
