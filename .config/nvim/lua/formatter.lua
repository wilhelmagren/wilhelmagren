local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    python = { "ruff_format" },
    rust = { "cargo_fmt" },
  },
  -- These options will be passed to `conform.format()`.
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters = {
    ruff_format = {
      command = "ruff",
      args = { "format", "-" },
      stdin = true,
    },
    cargo_fmt = {
      command = "cargo",
      args = { "fmt" },
      stdin = false,
    },
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.py', '*.rs' },
  callback = function()
    conform.format({ async = true })
    vim.cmd('checktime')
  end,
})
