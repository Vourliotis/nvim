local default_colors = require('kanagawa.colors').setup()
local default_config = require('kanagawa').config

local colors = {
  bg = default_colors.sumiInk0,
  keywords = default_colors.sakuraPink,
  statements = default_colors.autumnYellow,
  nvimtree = '#111119',
  bg_status = default_colors.sumiInk1,
}

local overrides = {
  Keyword = vim.tbl_extend('force', { fg = colors.keywords }, default_config.keywordStyle),
  Statement = vim.tbl_extend('force', { fg = colors.statements }, default_config.statementStyle),
  Conditional = { fg = colors.keywords },
  NormalFloat = { fg = default_colors.fg, bg = colors.bg },
  FloatBorder = { fg = default_colors.fg_border, bg = colors.bg },
  ColorColumn = { bg = default_colors.bg_light0 },
  CursorLineNr = { fg = default_colors.fg, bold = true },
  NvimTreeNormal = { fg = default_colors.fg, bg = colors.nvimtree },
  NvimTreeNormalNC = { link = 'NvimTreeNormal' },
  BufferLineFill = { bg = colors.bg },
  BufferLineBackground = { fg = default_colors.fg, bg = colors.bg },
  BufferLineBufferVisible = { link = 'BufferLineBackground' },
  BufferLineSeparator = { fg = colors.bg, bg = colors.bg },
  BufferLineIndicatorSelected = { fg = colors.bg, bg = colors.bg },
}

require('kanagawa').setup({
  undercurl = true,
  commentStyle = { italic = false },
  functionStyle = {},
  keywordStyle = { bold = false },
  statementStyle = { bold = false },
  typeStyle = {},
  variablebuiltinStyle = { italic = false },
  specialReturn = true,
  specialException = true,
  transparent = false,
  dimInactive = false,
  globalStatus = true,
  colors = colors,
  overrides = overrides,
})

vim.cmd('colorscheme kanagawa')
