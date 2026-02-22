vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = true,
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or true,
  virtual_text = false,
})

require('tiny-inline-diagnostic').setup({
  preset = 'amongus',
  options = {
    throttle = 10,
    override_open_float = true,
  },
})
