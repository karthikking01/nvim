return {
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			}
			opts.mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			})
			return opts
		end,
	},
}
