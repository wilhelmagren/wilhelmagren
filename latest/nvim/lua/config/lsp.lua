local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, fn, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, fn, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Enabme the variable under your cursor.
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a suggested code action.
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under the cursor.
    map('grr', builtin.lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under the cursor.
    map('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under the cursor.
    map('grd', builtin.lsp_definitions, '[G]oto [D]efinition')

    -- Jump to the type of the word under your cursor.
    map('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')

    -- Hover on the buffer.
    map('K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, 'Hover')
    
    -- Format the file according to its filetype.
    map('<leader>f', function() vim.lsp.buf.format({ async = true }) end, '[F]ormat')
  end,
})

vim.diagnostic.config({
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  -- Python LSP: `ruff`
  ruff = {
    cmd = { 'uvx', 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = {
      'pyproject.toml',
      'ruff.toml',
      '.ruff.toml',
      '.git',
    },
    -- ruff has very based default settings :9
    settings = {}
  },

  -- Rust LSP: `rust-analyzer`
  rust_analyzer = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = {
      'Cargo.toml',
      '.git',
    },
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = false,
          runBuildScripts = true,
        },
        procMacro = { enable = true },
        completion = { postFix = { enable = true } },
      },
    },
  },
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
