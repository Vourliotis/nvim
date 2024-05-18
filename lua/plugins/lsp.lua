return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = {} },
    'hrsh7th/nvim-cmp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')

    local handlers = require('lsp.handlers')
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      },
      html = {
        filetypes = { 'html', 'eruby' },
      },
      rubocop = {
        -- The lspconfig of rubocop runs `bundle exec` in front of the cmd by
        -- default when it detects a Gemfile, and as a result does not use the
        -- executable installed by Mason. This overwrites that behaviour.
        on_new_config = function(config, _)
          config.cmd = { 'rubocop', '--lsp' }
        end,
      },
    }

    mason_lspconfig.setup_handlers({
      function(server_name)
        local default_config = {
          capabilities = capabilities,
          on_attach = handlers.on_attach,
        }

        lspconfig[server_name].setup(vim.tbl_extend('force', default_config, servers[server_name] or {}))
      end,
    })
  end,
}
