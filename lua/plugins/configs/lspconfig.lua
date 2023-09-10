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
  rubocop = {
    on_attach = handlers.on_attach_no_formatting,
    -- The lspconfig of rubocop runs `bundle exec` in front of the cmd by
    -- default when it detects a Gemfile, and as a result does not use the
    -- executable installed by Mason. This overwrites that behaviour.
    on_new_config = function(config, _)
      config.cmd = { 'rubocop', '--lsp' }
    end,
  },
}

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local default_config = {
      capabilities = capabilities,
      on_attach = handlers.on_attach,
    }

    lspconfig[server_name].setup(vim.tbl_extend('force', default_config, servers[server_name] or {}))
  end,
})
