return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local server_configurations = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      },
    }

    local servers = vim.tbl_keys(server_configurations or {})
    vim.list_extend(servers, { 'stylua' })

    for _, server in ipairs(servers) do
      local server_configuration = server_configurations[server] or {}
      server_configuration.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

      vim.lsp.enable(server)
      vim.lsp.config(server, server_configuration)
    end
  end,
}
