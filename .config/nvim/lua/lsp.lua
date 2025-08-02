local builtin = require('telescope.builtin')

-- This function gets executed when an LSP attaches to a particular buffer.
--  That is to say, every time a new file is opened that is associated with
--  an lsp this function will be executed to configure the current buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, fn, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, fn, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
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

-- LSP Servers and clients are able to communicate to each other what features they support.
--  By default, Neovim doesn't support everything that is in the lSP specification.
--  So, we create new capabilities with blink and then broadcast that to the servers.
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Enable the following language servers with corresponding config.
local servers = {
  -- Lua LSP: `lua-language-server`
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';'),
        },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        completion = {
          callSnippet = 'Replace',
        },
        telemetry = { enable = false },
      },
    },
  },

  -- Python LSP: `ruff`.
  ruff = { cmd = { 'ruff', 'server' } },

  pyright = {
    settings = {
      python = {
        analysis = {
          -- Automatically add paths from the Python environment or workspace.
          autoSearchPaths = true,
          -- Let Pyright read library source code for better type inference.
          useLibraryCodeForTypes = true,
          -- Analyze all files in the project, not just open ones.
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  },

  -- Rust LSP: `rust-analyzer`.
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = false,
          runBuildScripts = true,
        },
        procMacro = { enable = true },
        completion = { postfix = { enable = true } },
      },
    },
  },
}

local lspconfig = require('lspconfig')
for server, cfg in pairs(servers) do
  cfg.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  lspconfig[server].setup(cfg)
end
