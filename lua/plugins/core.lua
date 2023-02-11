local vscode = require('core.utils').vscode

return {
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    cond = not vscode,
    cmd = 'Telescope',
    dependencies = {
      {
        'olimorris/persisted.nvim',
        keys = {
          { '<LEADER>sl', '<CMD>Telescope persisted<CR>', mode = 'n' },
          { '<LEADER>ss', '<CMD>SessionSave<CR>', mode = 'n' },
        },
        config = function()
          require('plugins.configs.persisted')
        end,
      },
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        keys = {
          { '<LEADER>fw', '<CMD>Telescope live_grep_args<CR>', mode = 'n' },
        },
      },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<LEADER>?', '<CMD>Telescope keymaps<CR>', mode = 'n' },
      { '<LEADER>ff', '<CMD>Telescope find_files<CR>', mode = 'n' },
      { '<LEADER>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>', mode = 'n' },
      { '<LEADER>fb', '<CMD>Telescope buffers<CR>', mode = 'n' },
      { '<LEADER>fr', '<CMD>Telescope resume<CR>', mode = 'n' },
      { '<LEADER>fp', '<CMD>Telescope pickers<CR>', mode = 'n' },
      { '<LEADER>fh', '<CMD>Telescope help_tags<CR>', mode = 'n' },
    },
    config = function()
      require('plugins.configs.telescope')
    end,
  },
  {
    'kyazdani42/nvim-tree.lua',
    cond = not vscode,
    keys = {
      { '<LEADER>e', '<CMD>NvimTreeToggle<CR>', mode = 'n' },
    },
    config = function()
      require('plugins.configs.nvimtree')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    cond = not vscode,
    build = ':TSUpdate',
    dependencies = {
      {
        'RRethy/nvim-treesitter-endwise',
        config = function()
          require('nvim-treesitter.configs').setup({ endwise = { enable = true } })
        end,
      },
    },
    config = function()
      require('plugins.configs.treesitter')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    cond = not vscode,
    lazy = false,
    version = 'v2.*',
    config = function()
      require('plugins.configs.toggleterm')
    end,
  },
}