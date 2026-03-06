return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim", -- Fixed typo
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		bind_to_cwd = true,
		sources = { "filesystem", "buffers", "git_status" },
		window = { width = 30 },
		follow_current_file = { enabled = true	},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		-- Only open neo-tree automatically when a directory is given as argument
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			vim.cmd("Neotree toggle")
		end
	end,
}
