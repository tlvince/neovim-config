local lspconfig = require('lspconfig')
local languages = require('format')
local on_attach = require('on-attach')

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
  on_attach = on_attach
}

lspconfig.efm.setup {
  capabilities = capabilities,
  on_attach = on_attach,
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

lspconfig.tflint.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
