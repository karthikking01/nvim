-- Extend LazyVim's nvim-lint config via opts
return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            -- Explicitly replace LazyVim's default linters_by_ft (which includes
            -- vale, tflint, jsonlint, hadolint, clj-kondo, etc.) with only what we want.
            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescript = { "eslint_d" },
                typescriptreact = { "eslint_d" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
    {
		"rshkarin/mason-nvim-lint",
        dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-lint" },
        opts = function(_, opts)
            -- Extend LazyVim's ensure_installed rather than replacing it.
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "eslint_d" })
            -- Suppress install attempts for linters not in Mason's registry.
            opts.ignore_install = { "vale", "tflint", "jsonlint", "hadolint", "clj-kondo", "inko", "janet", "ruby" }
            return opts
        end,
    },
}
