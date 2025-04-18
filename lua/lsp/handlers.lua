local M = {}

-- Custom on attach function.
M.on_attach = function(_, bufr)
  local lsp = vim.lsp
  local bind = vim.keymap.set
  local opts = { buffer = bufr }

  bind('n', '<LEADER>ca', lsp.buf.code_action, opts)
  bind('n', '<LEADER>rn', lsp.buf.rename, opts)
  bind('n', '<LEADER>td', lsp.buf.type_definition, opts)
  bind('n', '<LEADER>ds', require('fzf-lua').lsp_document_symbols(), opts)
  bind('n', '<LEADER>ws', require('fzf-lua').lsp_workspace_symbols(), opts)

  bind('n', 'gd', lsp.buf.definition, opts)
  bind('n', 'gr', require('fzf-lua').lsp_references, opts)
  bind('n', 'gi', require('fzf-lua').lsp_implementations, opts)
  bind('n', 'gD', lsp.buf.declaration, opts)
  bind('n', 'K', lsp.buf.hover, opts)
  bind('i', '<c-k>', lsp.buf.signature_help, opts)
end

return M
