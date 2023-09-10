local vscode = require('core.utils').vscode

return {
  {
    'neovim/nvim-lspconfig',
    cond = not vscode,
    version = false,
    event = 'BufEnter',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup()
        end,
      },
      'williamboman/mason-lspconfig.nvim',
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('null-ls').setup({
            sources = {
              require('null-ls').builtins.diagnostics.stylelint,
              require('null-ls').builtins.diagnostics.eslint_d,
              require('null-ls').builtins.formatting.stylelint,
              require('null-ls').builtins.formatting.prettierd,
              require('null-ls').builtins.formatting.stylua,
              require('null-ls').builtins.formatting.erb_lint,
            },
          })
        end,
      },
      {
        'jayp0521/mason-null-ls.nvim',
        config = function()
          require('mason-null-ls').setup({
            automatic_installation = true,
          })
        end,
      },
    },
    config = function()
      require('plugins.configs.lspconfig')
    end,
  },
  {
    'j-hui/fidget.nvim',
    cond = not vscode,
    event = 'BufEnter',
    tag = 'legacy',
    config = function()
      require('fidget').setup()
    end,
  },
}
