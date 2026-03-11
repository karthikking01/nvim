-- Extend LazyVim's telescope config with ui-select and ast_grep extensions.
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = function(_, opts)
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        ["ui-select"] = require("telescope.themes").get_dropdown({}),
      })
      return opts
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "ui-select")
      pcall(telescope.load_extension, "ast_grep")
    end,
  },
  {
    "Marskey/telescope-sg",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
