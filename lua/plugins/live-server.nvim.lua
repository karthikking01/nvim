return {
	"barrettruth/live-server.nvim",
	cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
	init = function()
		vim.g.live_server = vim.g.live_server or {}
	end,
}
