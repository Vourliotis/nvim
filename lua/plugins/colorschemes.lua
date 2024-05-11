return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('plugins.configs.nightfox')
      vim.cmd('colorscheme nightfox')
    end,
  },
}
