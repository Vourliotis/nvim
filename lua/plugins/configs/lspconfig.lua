local success, lspconfig = pcall(require, 'lspconfig')

if not success then
  return
end

local handlers = require('lsp.handlers')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = handlers.on_attach,
      capabilities = capabilities,
    })
  end,
  ['lua_ls'] = function()
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
  end,
  ['solargraph'] = function()
    lspconfig.solargraph.setup({
      on_attach = handlers.on_attach_no_formatting,
      settings = { solargraph = { diagnostics = false } },
    })
  end,
  ['tsserver'] = function()
    lspconfig.tsserver.setup({
      on_attach = handlers.on_attach_no_formatting,
    })
  end,
  ['emmet_ls'] = function()
    lspconfig.emmet_ls.setup({
      on_attach = handlers.on_attach_no_formatting,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'eruby' },
    })
  end,
  ['html'] = function()
    lspconfig.html.setup({
      filetypes = { 'html', 'eruby' },
    })
  end,
})
