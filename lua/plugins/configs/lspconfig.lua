local success, lspconfig = pcall(require, 'lspconfig')

if not success then
  return
end

local handlers = require('lsp.handlers')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = capabilities,
    })
  end,
})

-- Modified language server settings
lspconfig.solargraph.setup({
  on_attach = handlers.on_attach_no_formatting,
  settings = { solargraph = { diagnostics = false } },
})

lspconfig.tsserver.setup({
  on_attach = handlers.on_attach_no_formatting,
})

lspconfig.sumneko_lua.setup({
  on_attach = handlers.on_attach_no_formatting,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lspconfig.emmet_ls.setup({
  on_attach = handlers.on_attach_no_formatting,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'eruby' },
})

lspconfig.html.setup({
  filetypes = { 'html', 'eruby' },
})
