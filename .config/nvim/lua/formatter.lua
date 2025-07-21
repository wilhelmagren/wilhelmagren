require('conform').setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        rust = { "cargo_fmt" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters = {
        ruff_format = {
            command = "ruff",
            args = { "format", "-"  },
            stdin = true,
        },
        cargo_fmt = {
            command = "cargo",
            args = { "fmt", "--", "-" },
            stdin = true,
        },
    },
})
