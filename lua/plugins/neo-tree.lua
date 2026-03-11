-- Extend LazyVim's neo-tree config via opts
return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		sources = { "filesystem", "buffers", "git_status" },
		window = { width = 30 },
		filesystem = {
			bind_to_cwd = true,
			follow_current_file = { enabled = true },
		},
	},
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
