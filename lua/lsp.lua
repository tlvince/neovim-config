local lspconfig = require('lspconfig')
local languages = require('format')
local on_attach = require('on-attach')

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern(".git")
}

lspconfig.efm.setup {
  capabilities = capabilities,
  on_attach = function(client)
    vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  end,
  init_options = {
    documentFormatting = true
  },
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = {
      ".git", "package.json", "node_modules", "tsconfig.json"
    },
    languages = languages
  }
}
