local success, lualine = pcall(require, 'lualine')

if not success then
  return
end

local function get_color(group, attr)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

local colors = {
  fg = get_color('Normal', 'fg'),
  bg = get_color('Normal', 'bg'),
  status_line_fg = get_color('StatusLine', 'fg'),
  status_line_bg = get_color('StatusLine', 'bg'),
  success = get_color('diffAdded', 'fg'),
  error = get_color('diffRemoved', 'fg'),
  warning = get_color('diffChanged', 'fg'),
  info = get_color('DiagnosticInfo', 'fg'),
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
  color = { fg = colors.status_line_fg, bg = colors.status_line_bg, gui = 'bold' },
  separator = { right = separators.slant_bottom_right },
})

ins_left({
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  color = { bg = colors.bg },
  separator = { right = separators.slant_top_right },
  diagnostics_color = {
    color_error = { fg = colors.error },
    color_warn = { fg = colors.warning },
    color_info = { fg = colors.info },
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
  function()
    return require('gitblame').get_current_blame_text()
  end,
  cond = require('gitblame').is_blame_text_available
})

ins_right({
  function()
    return '%s{}'
  end,
  color = { bg = colors.error },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return '%s{}'
  end,
  color = { bg = colors.warning },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return '%s{}'
  end,
  color = { bg = colors.success },
  padding = { left = -1 },
  separator = { left = separators.left },
})

ins_right({
  function()
    return '%s{}'
  end,
  color = { bg = colors.info },
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
    added = { fg = colors.success, gui = 'bold' },
    modified = { fg = colors.warning, gui = 'bold' },
    removed = { fg = colors.error, gui = 'bold' },
  },
  cond = conditions.hide_in_width,
  color = { bg = colors.bg },
  separator = { left = separators.left },
})

ins_right({
  'branch',
  icon = '',
  color = { fg = colors.status_line_fg, bg = colors.status_line_bg, gui = 'bold' },
  separator = { left = separators.left },
})

lualine.setup(config)
