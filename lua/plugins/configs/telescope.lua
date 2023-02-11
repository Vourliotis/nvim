local success, telescope = pcall(require, 'telescope')

if not success then
  return
end

local defaults = function(title)
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
    cache_picker = {
      num_pickers = 10,
    },
  },
  pickers = {
    buffers = dropdown('Buffers'),
    find_files = dropdown('Files'),
    grep_string = defaults('Search'),
    live_grep = defaults('Grep'),
    commands = defaults('Commands'),
    help_tags = defaults('Help Tags'),
    keymaps = defaults('Keymaps'),
    pickers = defaults('Pickers'),
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
          ['<C-h>'] = lga_actions.quote_prompt(),
          ['<C-l>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
        },
      },
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('persisted')
telescope.load_extension('live_grep_args')
