return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<LEADER>e', '<cmd>Oil<CR>' },
    },
    opts = {
      keymaps = {
        ['<C-h>'] = 'actions.parent',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    dependencies = 'stevearc/oil.nvim',
    opts = function(_, opts)
      table.insert(opts.winbar.lualine_c, {
        function()
          local filepath = require('oil').get_current_dir()
          local home = os.getenv('HOME')

          filepath = filepath:gsub('^' .. home, '~')
          filepath = filepath:gsub('/$', '')

          return filepath
        end,
        cond = function()
          return require('oil').get_current_dir() ~= nil
        end,
        color = { fg = require('ui.utils').colors.info },
      })
    end,
  },
}
