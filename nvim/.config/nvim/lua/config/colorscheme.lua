require('rose-pine').setup({
  variant = 'moon',
  styles = { transparency = true },
  highlight_gruops = {
    DiagnosticUnderlineError = { underline = true, undercurl = false },
    DiagnosticUnderlineWarn = { underline = true, undercurl = false },
    DiagnosticUnderlineInfo = { underline = true, undercurl = false },
    DiagnosticUnderlineHint = { underline = true, undercurl = false },
  },
})

vim.cmd.colorscheme('rose-pine')
