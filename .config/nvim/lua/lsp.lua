-- Register 'D' and 'S' keymaps in normal mode for reading documentation
-- in the current buffer and finding usage of object.
local on_attach = function(_, _)
    vim.keymap.set('n', 'D', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'S', require('telescope.builtin').lsp_references, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

-- Lua.
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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
            telemtry = { enable = false },
        },
    },
})

-- Python.
lspconfig.ruff.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { 'ruff', 'server' },
})

-- Rust.
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        [ 'rust-analyzer' ] = {
            cargo = {
                allFeatures = true,
                runBuildScripts = true,
            },
            procMacro = { enable = true },
            checkOnSave = { command = 'clippy' },
            completion = { postfix = { enable = true, } },
        },
    },
})

