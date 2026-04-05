-- Extend LazyVim's neo-tree config via opts
return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		window = {
			width = 30,
			position = "left",
		},
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = { enabled = true },
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		-- Make neo-tree window transparent with 0.3 opaqueness (70% transparent)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "neo-tree",
			callback = function()
				-- Set window blend to 70 for 70% transparency
				vim.wo.winblend = 70
				-- Clear highlights to make transparent
				vim.cmd("highlight NeoTreeNormal guibg=NONE ctermbg=NONE")
				vim.cmd("highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE")
				vim.cmd("highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE")
				vim.cmd("highlight NeoTreeCursorLine guibg=rgba(255,255,255,0.1) ctermbg=NONE")
			end,
		})
	end,
	init = function()
		-- Open neo-tree rooted at the passed directory when starting nvim with a directory arg
		if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			local dir = vim.fn.fnamemodify(vim.fn.argv(0), ":p")
			vim.schedule(function()
				vim.cmd.cd(dir)
				local ok, command = pcall(require, "neo-tree.command")
				if ok then
					command.execute({
						source = "filesystem",
						action = "show",
						dir = dir,
						position = "left",
						reveal = true,
					})
				end
			end)
		end
	end,
}
