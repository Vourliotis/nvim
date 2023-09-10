local lspconfig_success, lspconfig = pcall(require, 'lspconfig')
local mason_lspconfig_success, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not (lspconfig_success and mason_lspconfig_success) then
  return
end

local handlers = require('lsp.handlers')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

local servers = {
  lua_ls = {
    on_attach = handlers.on_attach_no_formatting,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },
  tsserver = {
    on_attach = handlers.on_attach_no_formatting,
  },
  emmet_ls = {
    on_attach = handlers.on_attach_no_formatting,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'eruby' },
  },
  html = {
    filetypes = { 'html', 'eruby' },
  },
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = (servers[server_name] or {}).on_attach or handlers.on_attach,
      settings = (servers[server_name] or {}).settings,
      filetypes = (servers[server_name] or {}).filetypes,
    })
  end,
})
