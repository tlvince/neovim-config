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

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lspconfig.efm.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
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
