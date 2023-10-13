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
