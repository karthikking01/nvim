-- LazyVim already provides: expandtab, tabstop=2, shiftwidth=2, number,
-- relativenumber, signcolumn, clipboard, foldcolumn.
-- Only set options that differ from or extend LazyVim defaults here.

vim.opt.wildignorecase = true
vim.opt.signcolumn = "yes:1" -- extra column padding beyond LazyVim default

-- Use the OS clipboard for yanks/pastes in both directions (+ register).
vim.opt.clipboard = "unnamedplus"
