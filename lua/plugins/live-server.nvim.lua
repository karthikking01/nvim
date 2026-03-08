return {
	"barrettruth/live-server.nvim",
	cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
	config = function(_, opts)
		require("live-server").setup(opts)
	end,
}
