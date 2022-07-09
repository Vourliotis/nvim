local lualine = require('lualine')
local kanagawa = require('kanagawa.colors').setup()
local git_blame = require('gitblame')

-- stylua: ignore
local colors = {
  bg       = kanagawa.sumiInk0,
  bg_light = kanagawa.sumiInk1,
  fg       = kanagawa.fujiWhite,
  yellow   = kanagawa.autumnYellow,
  cyan     = kanagawa.crystalBlue,
  green    = kanagawa.springGreen,
  orange   = kanagawa.surimiOrange,
  violet   = kanagawa.oniViolet,
  magenta  = kanagawa.sakuraPink,
  blue     = kanagawa.crystalBlue,
  red      = kanagawa.peachRed,
}

local separators = {
  vert = '┃',
  bar = '█',
  bar_small = '▊',
  dot = '●',
  left = '',
  right = '',
  left_small = '',
  right_small = '',
  slant_bottom_left = '',
  slant_bottom_right = '',
  slant_top_left = '',
  slant_top_right = '',
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

local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = nil } },
      inactive = { c = { fg = colors.fg, bg = nil } },
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

ins_left({
  'filename',
  cond = conditions.buffer_not_empty,
  path = 1,
  color = { bg = colors.bg_light, gui = 'bold' },
  separator = { right = separators.slant_bottom_right },
})

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  color = { bg = colors.bg },
  separator = { right = separators.slant_top_right },
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
  separator = { left = separators.left },
  color = { fg = colors.bg, bg = colors.fg },
})

ins_right({
  function()
    return ' '
  end,
  color = { bg = colors.red },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return ' '
  end,
  color = { bg = colors.yellow },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return ' '
  end,
  color = { bg = colors.green },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return ' '
  end,
  color = { bg = colors.blue },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  'o:encoding',
  cond = conditions.hide_in_width,
  color = { fg = colors.fg, bg = colors.bg },
  separator = { left = separators.left },
})

ins_right({
  'filetype',
  color = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
  separator = { left = separators.left },
})

ins_right({
  'diff',
  symbols = { added = '+', modified = '~', removed = '-' },
  diff_color = {
    added = { fg = colors.green, gui = 'bold' },
    modified = { fg = colors.orange, gui = 'bold' },
    removed = { fg = colors.red, gui = 'bold' },
  },
  cond = conditions.hide_in_width,
  color = { bg = colors.bg },
  separator = { left = separators.left },
})

ins_right({
  'branch',
  icon = '',
  color = { bg = colors.bg_light, fg = colors.fg, gui = 'bold' },
  separator = { left = separators.left },
})
lualine.setup(config)
