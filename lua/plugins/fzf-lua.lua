-- Use ~/.local/bin/fzf (>= 0.53) instead of the outdated system fzf (Debian 0.44).
-- The `transform` action used by fzf-lua requires fzf >= 0.53.
return {
    "ibhagwan/fzf-lua",
    opts = {
        fzf_bin = vim.fn.expand("~/.local/bin/fzf"),
    },
}
