-- ╭─────────────────────────────────────╮
-- │           General / Global          │
-- ╰─────────────────────────────────────╯
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<A-k>", ":t.<CR>", { desc = "Duplicate line down" })

-- ╭─────────────────────────────────────╮
-- │                LSP                  │
-- ╰─────────────────────────────────────╯

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
  end,
})

-- ╭─────────────────────────────────────╮
-- │           Telescope                 │
-- ╰─────────────────────────────────────╯
local telescope = require('utils.telescope')
vim.keymap.set('n', '<leader>ff', telescope.builtin('find_files'), { desc = 'Telescope files' })
vim.keymap.set('n', '<leader>fg', telescope.builtin('live_grep'), { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ag', telescope.extension('ast_grep', 'ast_grep'), { desc = 'Telescope ast-grep' })

-- ╭─────────────────────────────────────╮
-- │           Neo-tree / Oil            │
-- ╰─────────────────────────────────────╯
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
-- etc.
-- ╭─────────────────────────────────────╮
-- │           Debugger                  │
-- ╰─────────────────────────────────────╯
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Continue' })
vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Continue' })
