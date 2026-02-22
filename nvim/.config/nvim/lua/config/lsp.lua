-- [[ Set up lsp and diagnostics ]]
-- See `help: lsp` and `help: diagnostic`
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, fn, desc, mode)
      -- default to normal mode
      mode = mode or 'n'
      vim.keymap.set(mode, keys, fn, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('grr', builtin.lsp_references, '[G]oto [R]eferences')
    map('gri', builtin.lsp_implementation, '[G]oto [I]mplementation')
    map('grd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('grt', builtin.lsp_type_definitions, '[G]oto [T]type definition')
    map('K', function()
      vim.lsp.buf.hover({ border = 'rounded' })
    end, 'Hover')
    map('<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, '[F]ormat')
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnotic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  },
  virtual_text = false,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable the following language servers with the specified config.
local servers = {
  -- Python LSP: 'ruff'
  -- Used for linting and formatting
  -- https://github.com/astral-sh/ruff
  ruff = {
    cmd = { 'uv', 'run', 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = {
      'pyproject.toml',
      'ruff.toml',
      '.ruff.toml',
      '.git',
    },
    -- ruff has based settings :)
    settings = {},
  },

  -- Python LSP: 'ty'
  -- Used for completions and LSP intelligence
  -- https://github.com/astral-sh/ty
  ty = {
    cmd = { 'uv', 'run', 'ty', 'server' },
  },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    '.git',
  },
  settings = {},
}

for server, config in pairs(servers) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = config.filetypes,
    group = vim.api.nvim_create_augroup('lsp_' .. server, { clear = true }),
    callback = function(args)
      local buf = args.buf
      local root = vim.fs.root(buf, config.root_markers) or vim.fs.dirname(vim.api.nvim_buf_get_name(buf))
      vim.lsp.start(vim.tbl_extend('force', {
        name = server,
        root_dir = root,
        capabilities = capabilities,
      }, config))
    end,
  })
end
