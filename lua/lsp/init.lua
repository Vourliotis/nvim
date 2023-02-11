-- Diagnostics floatic window
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  float = {
    border = 'single',
    format = function(diagnostic)
      return string.format(
        '%s (%s) [%s]',
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})

-- Add borders to hover windows.
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single',
  }
)

-- Add borders to signature help windows.
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = 'single',
  }
)
