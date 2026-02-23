--edit visual TAB spacing
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "

--padding
vim.opt.signcolumn = "yes:1"
vim.opt.foldcolumn = "1"
vim.opt.winbar = " "
vim.opt.wildignorecase = true
vim.opt.clipboard = "unnamedplus"
