local default_colors = require('kanagawa.colors').setup()
local default_config = require('kanagawa').config

local colors = {
  bg = default_colors.sumiInk0,
  keywords = default_colors.sakuraPink,
  statements = default_colors.autumnYellow,
  nvimtree = '#111119',
  bg_status = default_colors.sumiInk1,
  fg_border = default_colors.fg,
}

local overrides = {
  Keyword = vim.tbl_extend('force', { fg = colors.keywords }, default_config.keywordStyle),
  Statement = vim.tbl_extend('force', { fg = colors.statements }, default_config.statementStyle),
  Conditional = { fg = colors.keywords },
  NormalFloat = { fg = default_colors.fg, bg = colors.bg },
  ColorColumn = { bg = colors.bg },
  CursorLineNr = { fg = default_colors.fg, bold = true },
  NvimTreeNormal = { fg = default_colors.fg, bg = colors.nvimtree },
  NvimTreeNormalNC = { link = 'NvimTreeNormal' },
  BufferCurrent = { bold = true },
  BufferCurrentMod = { fg = default_colors.springGreen, bold = true },
  BufferVisibleMod = { fg = default_colors.autumnGreen },
  BufferInactiveMod = { link = 'BufferVisibleMod' },
}

vim.cmd('highlight clear ColorColumn')

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
