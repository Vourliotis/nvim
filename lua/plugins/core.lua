return {
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        keys = {
          { '<LEADER>fw', '<CMD>Telescope live_grep_args<CR>', mode = 'n' },
        },
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable('make') == 1 and not vim.g.vscode,
      },
    },
    keys = {
      { '<LEADER>?', '<CMD>Telescope keymaps<CR>', mode = 'n' },
      { '<LEADER>ff', '<CMD>Telescope find_files<CR>', mode = 'n' },
      { '<LEADER>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>', mode = 'n' },
      { '<LEADER>fb', '<CMD>Telescope buffers<CR>', mode = 'n' },
      { '<LEADER>fr', '<CMD>Telescope resume<CR>', mode = 'n' },
      { '<LEADER>fp', '<CMD>Telescope pickers<CR>', mode = 'n' },
      { '<LEADER>fh', '<CMD>Telescope help_tags<CR>', mode = 'n' },
      {
        '<LEADER>f/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end,
        mode = 'n',
      },
    },
    config = function()
      require('plugins.configs.telescope')
    end,
  },
  {
    'echasnovski/mini.files',
    version = '*',
    keys = {
      {
        '<LEADER>e',
        function()
          local MiniFiles = require('mini.files')

          if not MiniFiles.close() then
            MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
          end
        end,
        mode = 'n',
      },
    },
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'nvim-treesitter/playground' },
      {
        'RRethy/nvim-treesitter-endwise',
        config = function()
          require('nvim-treesitter.configs').setup({ endwise = { enable = true } })
        end,
      },
      {
        'kevinhwang91/nvim-ufo',
        event = 'BufEnter',
        dependencies = {
          'kevinhwang91/promise-async',
        },
        config = function()
          require('plugins.configs.ufo')
        end,
      },
      'nvim-treesitter/nvim-treesitter-textobjects',
      {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        opts = {},
      },
    },
    config = function()
      require('plugins.configs.treesitter')
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = 'v2.*',
    opts = {
      open_mapping = [[<c-\>]],
      size = 20,
    },
  },
  {
    'chentoast/marks.nvim',
    opts = {},
  },
  {
    'tiagovla/scope.nvim',
    opts = {},
  },
}
