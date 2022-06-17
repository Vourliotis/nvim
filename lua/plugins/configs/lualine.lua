local git_blame = require('gitblame')

-- Disable virtual text
vim.g.gitblame_display_virtual_text = 0

-- Display time relative
vim.g.gitblame_message_template = '<summary> • <date> • <author>'
vim.g.gitblame_date_format = '%r'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }, 'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
