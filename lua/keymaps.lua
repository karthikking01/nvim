-- ╭─────────────────────────────────────╮
-- │           General / Global          │
-- ╰─────────────────────────────────────╯
-- NOTE: <leader>w is LazyVim's window-group prefix; use <C-s> to save instead.
-- LazyVim already maps <C-s> to save; the line below is kept as a personal alias.
vim.keymap.set("n", "<leader>W", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<A-k>", ":t.<CR>", { desc = "Duplicate line down" })
vim.keymap.set("n", "<leader>xr", ":%s///gI<Left><Left><Left>", { desc = "Find and replace in file" })

-- ╭─────────────────────────────────────╮
-- │                LSP                  │
-- ╰─────────────────────────────────────╯
-- LazyVim already maps: K (hover), gd (definition), gr (references),
-- <leader>cr (rename), <leader>ca (code action), <leader>cd (line diagnostics),
-- [d / ]d (prev/next diagnostic), <leader>cf (format).
-- Only add keymaps here that LazyVim does NOT provide.

-- ╭─────────────────────────────────────╮
-- │           Telescope                 │
-- ╰─────────────────────────────────────╯
-- LazyVim already maps core Telescope finders.
-- Only add the custom ast-grep picker here.
vim.keymap.set("n", "<leader>sg", function()
    require("telescope.builtin").live_grep()
end, { desc = "Search text in files" })
local telescope = require("utils.telescope")
vim.keymap.set("n", "<leader>ag", telescope.extension("ast_grep", "ast_grep"), { desc = "Telescope ast-grep" })
-- ╭─────────────────────────────────────╮
-- │           Neo-tree / Oil            │
-- ╰─────────────────────────────────────╯
-- LazyVim maps <leader>e / <leader>E for neo-tree.
-- <C-n> is kept as an additional personal shortcut.
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })

