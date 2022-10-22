local lsp = vim.lsp

local M = {}
local bind = vim.keymap.set

-- Add borders to hover windows.
M.hover = lsp.with(lsp.handlers.hover, {
  border = 'single',
})

-- Add borders to signature help windows.
M.signature_help = lsp.with(lsp.handlers.signature_help, {
  border = 'single',
})

-- Custom on attach function.
M.on_attach = function(client, bufr)
  local opts = { buffer = bufr }

  bind('n', 'ga', lsp.buf.code_action, opts)
  bind('n', 'gd', lsp.buf.definition, opts)
  bind('n', 'gD', lsp.buf.declaration, opts)
  bind('n', 'gi', lsp.buf.implementation, opts)
  bind('n', 'K', lsp.buf.hover, opts)
  bind('n', 'gr', lsp.buf.references, opts)
  bind('n', 'gR', lsp.buf.rename, opts)
  bind('i', '<c-k>', lsp.buf.signature_help, opts)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    bind('n', "'f", lsp.buf.format, opts)
  end

  if client.server_capabilities.document_range_formatting then
    bind('x', "'f", lsp.buf.range_formatting, opts)
  end
end

-- Custom on attach function which also disables formatting where null-ls will
-- be used to format.
M.lsp_on_attach_no_formatting = function(client)
  if vim.fn.has('nvim-0.8') == 1 then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  M.on_attach(client)
end

return M
