local vscode = require('core.utils').vscode

return {
  {
    'williamboman/mason.nvim',
    cond = not vscode,
    event = 'BufEnter',
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('mason-lspconfig').setup()
        end,
      },
      {
        'neovim/nvim-lspconfig',
        config = function()
          require('plugins.configs.lspconfig')
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
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('null-ls').setup({
            sources = {
              require('null-ls').builtins.diagnostics.rubocop,
              require('null-ls').builtins.formatting.prettierd,
              require('null-ls').builtins.formatting.stylua,
              require('null-ls').builtins.formatting.erb_lint,
            },
          })
        end,
      },
    },
    config = function()
      require('lsp')
      require('mason').setup()
    end,
  },
  {
    'j-hui/fidget.nvim',
    cond = not vscode,
    event = 'BufEnter',
    config = function()
      require('fidget').setup()
    end,
  },
}
