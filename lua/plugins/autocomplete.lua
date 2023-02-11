local vscode = require('core.utils').vscode

return {
  {
    'L3MON4D3/LuaSnip',
    cond = not vscode,
    lazy = false,
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip').filetype_extend('ruby', { 'rails' })
        end
      },
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip').config.set_config({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
      })
    end
  },
  {
    'hrsh7th/nvim-cmp',
    cond = not vscode,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      {
        'windwp/nvim-autopairs',
         config = function()
           require('plugins.configs.autopairs')
         end,
      }
    },
    config = function()
      require('plugins.configs.cmp')
    end,
  },
}
