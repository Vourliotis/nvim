local lsp = vim.lsp

local M = {}
local keymap = vim.keymap.set

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
  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufr }
  keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  keymap('i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    if vim.fn.has('nvim-0.8') == 1 then
      keymap('n', "'f", '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    else
      keymap('n', "'f", '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opts)
    end
  end
  if client.server_capabilities.document_range_formatting then
    keymap('x', "'f", '<cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>', opts)
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
