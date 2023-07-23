local vscode = require('core.utils').vscode

return {
  {
    'nvim-tree/nvim-web-devicons',
    cond = not vscode,
  },
  {
    'goolord/alpha-nvim',
    cond = not vscode,
    lazy = false,
    config = function()
      require('plugins.configs.alpha')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    cond = not vscode,
    lazy = false,
    dependencies = {
      {
        'f-person/git-blame.nvim',
        keys = {
          { '<LEADER>gu', '<CMD>GitBlameOpenCommitURL<CR>', mode = 'n' },
        },
        config = function()
          vim.g.gitblame_display_virtual_text = 0
          vim.g.gitblame_date_format = '%r'
        end,
      },
    },
    config = function()
      require('plugins.configs.lualine')
    end,
  },
  {
    'romgrk/barbar.nvim',
    cond = not vscode,
    lazy = false,
    keys = {
      { '<Tab>', '<CMD>BufferNext<CR>', mode = 'n' },
      { '<S-Tab>', '<CMD>BufferPrevious<CR>', mode = 'n' },
      { '<S-h>', '<CMD>BufferMovePrevious<CR>', mode = 'n' },
      { '<S-l>', '<CMD>BufferMoveNext<CR>', mode = 'n' },
      { '<C-p>', '<CMD>BufferPin<CR>', mode = 'n' },
      { '<C-w>', '<CMD>BufferClose<CR>', mode = 'n' },
      { '<A-w>', '<CMD>BufferClose!<CR>', mode = 'n' },
      { '<C-s>', '<CMD>BufferPick<CR>', mode = 'n' },
    },
    config = function()
      require('plugins.configs.barbar')
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    cond = not vscode,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('plugins.configs.blankline')
    end,
  },
  {
    'echasnovski/mini.indentscope',
    cond = not vscode,
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'alpha', 'dashboard', 'terminal', 'lazy', 'mason' },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      require('mini.indentscope').setup({
        draw = { animation = require('mini.indentscope').gen_animation.none() },
        options = { try_as_border = true },
        symbol = '▏',
      })
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    cond = not vscode,
    lazy = false,
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    cond = not vscode,
    lazy = false,
    config = function()
      require('scrollbar').setup()
    end,
  },
  {
    'lukas-reineke/virt-column.nvim',
    cond = not vscode,
    lazy = false,
    config = function()
      require('virt-column').setup({
        char = '▕',
      })
    end,
  },
}
