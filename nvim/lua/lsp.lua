require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'lua_ls',
        'ruff_lsp',
        'rust_analyzer',
        'golangci_lint_ls',
    }
})

local on_attach = function(_, _)
    vim.keymap.set('n', 'D', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'S', require('telescope.builtin').lsp_references, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').ruff_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').golangci_lint_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
