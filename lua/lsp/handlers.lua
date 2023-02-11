local M = {}

-- Custom on attach function.
M.on_attach = function(_, bufr)
  local lsp = vim.lsp
  local bind = vim.keymap.set
  local opts = { buffer = bufr }

  bind('n', "<LEADER>'f", lsp.buf.format, opts)
  bind('n', 'ga', lsp.buf.code_action, opts)
  bind('n', 'gd', lsp.buf.definition, opts)
  bind('n', 'gD', lsp.buf.declaration, opts)
  bind('n', 'gi', lsp.buf.implementation, opts)
  bind('n', 'K', lsp.buf.hover, opts)
  bind('n', 'gr', lsp.buf.references, opts)
  bind('n', 'gR', lsp.buf.rename, opts)
  bind('i', '<c-k>', lsp.buf.signature_help, opts)
end

-- Custom on attach function which also disables formatting where null-ls will
-- be used to format.
M.on_attach_no_formatting = function(client, bufr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  M.on_attach(client, bufr)
end

return M
