return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = {} },
    },
    config = function()
      require('plugins.configs.lspconfig')
    end,
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
