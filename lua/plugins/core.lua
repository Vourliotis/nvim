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
        opts = {
          use_git_branch = true,
          autosave = false,
          after_save = function()
            print('Session saved!')
          end,
          after_source = function(session)
            print('Loaded session ' .. session.name)
          end,
          telescope = {
            before_source = function()
              -- Close all open buffers
              -- Thanks to https://github.com/avently
              vim.api.nvim_input('<ESC>:%bd<CR>')
            end,
            after_source = function(session)
              print('Loaded session ' .. session.name)
            end,
          },
        },
      },
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        keys = {
          { '<LEADER>fw', '<CMD>Telescope live_grep_args<CR>', mode = 'n' },
        },
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
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
      { '<LEADER>fl', '<CMD>Telescope live_grep<CR>', mode = 'n' },
    },
    config = function()
      require('plugins.configs.telescope')
    end,
  },
  {
    'echasnovski/mini.files',
    cond = not vscode,
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
    cond = not vscode,
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
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { enable = false },
        keys = {
          {
            '<LEADER>ck',
            function()
              return require('treesitter-context').go_to_context()
            end,
            mode = 'n',
          },
          { '<LEADER>cc', '<CMD>TSContextToggle<CR>', mode = 'n' },
        },
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
    cond = not vscode,
    version = 'v2.*',
    opts = {
      open_mapping = [[<c-\>]],
      size = 20,
    },
  },
}
