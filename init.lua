-- Must be set before lazy.nvim loads (LazyVim requirement)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw so neo-tree can fully handle directory opens
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("vim-opts")
require("keymaps")
require("config.lazy")
