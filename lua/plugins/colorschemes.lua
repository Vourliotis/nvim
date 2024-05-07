local vscode = require('core.utils').vscode

return {
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
