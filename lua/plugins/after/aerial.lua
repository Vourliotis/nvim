return {
  {
    'stevearc/aerial.nvim',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons',
    },
    keys = {
      { '}', '<CMD>AerialPrev<CR>', mode = 'n' },
      { '{', '<CMD>AerialNext<CR>', mode = 'n' },
      { '<LEADER>at', '<CMD>AerialToggle<CR>', mode = 'n' },
    },
    opts = {
      layout = {
        max_width = { 90, 0.5 },
        default_direction = 'prefer_left',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    dependencies = 'stevearc/aerial.nvim',
    opts = function(_, opts)
      table.insert(opts.winbar.lualine_c, {
        'aerial',
        sep = '  ',
        depth = 3,
        colored = true,
        color = { bg = require('ui.utils').colors.bg },
      })
    end,
  },
}
