local lualine = require('lualine')
local kanagawa = require('kanagawa.colors').setup()
local git_blame = require('gitblame')

-- stylua: ignore
local colors = {
  bg       = kanagawa.sumiInk0,
  fg       = kanagawa.fujiWhite,
  yellow   = kanagawa.autumnYellow,
  cyan     = kanagawa.crystalBlue,
  darkblue = kanagawa.springViolet1,
  green    = kanagawa.springGreen,
  orange   = kanagawa.surimiOrange,
  violet   = kanagawa.oniViolet,
  magenta  = kanagawa.sakuraPink,
  blue     = kanagawa.crystalBlue,
  red      = kanagawa.peachRed,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,

  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,

  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,

  available_blame = function()
    return git_blame.is_blame_text_available()
  end,
}

-- Config
local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c on the left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x on the right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.orange },
  padding = { left = 0, right = 1 },
}

ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg },
  path = 1,
})

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

-- Middle section
ins_left({
  function()
    return '%='
  end,
})

-- Right section
ins_right({
  git_blame.get_current_blame_text,
  cond = conditions.available_blame,
})

ins_right({
  'diff',
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, gui = 'bold' },
})

ins_right({
  'filetype',
  color = { fg = colors.fg, gui = 'bold' }
})

ins_right({
  'branch',
  icon = '',
  color = { fg = colors.yellow, gui = 'bold' },
  padding = { left = 1, right = 1 },
})


lualine.setup(config)
