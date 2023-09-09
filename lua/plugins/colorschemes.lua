local vscode = require('core.utils').vscode

return {
  {
    'rebelot/kanagawa.nvim',
    cond = not vscode,
    priority = 1000,
    commit = '4c8d487',
    config = function()
      require('plugins.configs.kanagawa')
    end,
  },
  {
    'rose-pine/neovim',
    cond = not vscode,
    name = 'rose-pine',
    priority = 1000,
    commit = '63821c1',
    config = function()
      require('plugins.configs.rose_pine')
    end,
  },
  {
    'catppuccin/nvim',
    cond = not vscode,
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('plugins.configs.catppuccin')
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    cond = not vscode,
    priority = 1000,
    config = function()
      require('plugins.configs.nightfox')
      vim.cmd('colorscheme nightfox')
    end,
  },
}
