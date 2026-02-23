return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('telescope').setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    'Marskey/telescope-sg',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.load_extension('ast_grep')
    end
  }
}
