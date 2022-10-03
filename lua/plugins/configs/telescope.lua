local command = vim.api.nvim_create_user_command

local telescope = require('telescope')
local actions = require('telescope.actions')

command('TGrep', function(input)
  require('telescope.builtin').grep_string({ search = input.args })
end, { nargs = 1 })

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

    -- Default layout options
    prompt_prefix = ' ',
    selection_caret = '❯ ',
    layout_strategy = 'vertical',
    sorting_strategy = 'ascending',
    layout_config = {
      preview_cutoff = 25,
      mirror = true,
      prompt_position = 'top',
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
  },
})

telescope.load_extension('fzf')
telescope.load_extension('persisted')
telescope.load_extension('harpoon')
