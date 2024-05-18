local success, telescope = pcall(require, 'telescope')

if not success then
  return
end

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
local lga_actions = require('telescope-live-grep-args.actions')

telescope.setup({
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
  extensions = {
    fzf_native = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
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
        },
      },
    },
    aerial = {
      show_nesting = {
        ['_'] = false,
        json = true,
        yaml = true,
      },
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('live_grep_args')
telescope.load_extension('aerial')
