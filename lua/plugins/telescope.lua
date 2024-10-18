return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      keys = {
        { '<LEADER>fw', '<CMD>Telescope live_grep_args<CR>', mode = 'n' },
      },
      config = function()
        require('core.utils').on_load('telescope.nvim', function()
          local telescope = require('telescope')
          local lga_actions = require('telescope-live-grep-args.actions')
          local actions = require('telescope.actions')

          telescope.setup({
            extensions = {
              live_grep_args = {
                auto_quoting = true,
                mappings = {
                  i = {
                    ['<esc>'] = actions.close,
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-Up>'] = actions.cycle_history_next,
                    ['<C-Down>'] = actions.cycle_history_prev,
                    ['<C-h>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
                    ['<C-l>'] = lga_actions.quote_prompt({ postfix = " --iglob '!spec' --iglob " }),
                    ['<C-Space>'] = actions.to_fuzzy_refine,
                    ['<C-q>'] = actions.send_to_qflist,
                  },
                },
              },
            },
          })

          telescope.load_extension('live_grep_args')
        end)
      end,
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      cond = vim.fn.executable('make') == 1 and not vim.g.vscode,
      build = 'make',
      config = function()
        require('core.utils').on_load('telescope.nvim', function()
          local telescope = require('telescope')
          telescope.setup({
            extensions = {
              fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
              },
            },
          })

          telescope.load_extension('fzf')
        end)
      end,
    },
    'echasnovski/mini.icons',
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
  opts = function()
    local default = function(title)
      return {
        prompt_title = title,
        results_title = false,
      }
    end

    local dropdown = function(title, previewer)
      return {
        prompt_title = title,
        previewer = previewer or false,
        theme = 'dropdown',
      }
    end

    local actions = require('telescope.actions')

    return {
      defaults = {
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-Up>'] = actions.cycle_history_next,
            ['<C-Down>'] = actions.cycle_history_prev,
          },
        },
        prompt_prefix = '',
        selection_caret = '❯ ',
        layout_strategy = 'vertical',
        sorting_strategy = 'ascending',
        layout_config = {
          preview_cutoff = 25,
          mirror = true,
          prompt_position = 'top',
        },
        cache_picker = {
          num_pickers = 10,
        },
      },
      pickers = {
        buffers = dropdown('Buffers'),
        find_files = dropdown('Files'),
        grep_string = default('Search'),
        live_grep = default('Grep'),
        commands = default('Commands'),
        help_tags = default('Help Tags'),
        keymaps = default('Keymaps'),
        pickers = default('Pickers'),
      },
    }
  end,
}
