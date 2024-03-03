local vscode = require('core.utils').vscode

return {
  {
    'neovim/nvim-lspconfig',
    cond = not vscode,
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('plugins.configs.lspconfig')
    end,
  },
  {
    'j-hui/fidget.nvim',
    cond = not vscode,
    opts = {},
  },
}
