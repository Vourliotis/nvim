local success, kanagawa = pcall(require, 'kanagawa')

if not success then
  return
end

local default_colors = require('kanagawa.colors').setup()

local colors = {
  bg = default_colors.sumiInk0,
  keywords = default_colors.sakuraPink,
  statements = default_colors.autumnYellow,
  nvimtree = '#111119',
  bg_status = default_colors.sumiInk1,
  fg_border = default_colors.fg,
}

local overrides = {
  Keyword = vim.tbl_extend('force', { fg = colors.keywords }, kanagawa.config.keywordStyle),
  Statement = vim.tbl_extend('force', { fg = colors.statements }, kanagawa.config.statementStyle),
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

kanagawa.setup({
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

vim.cmd('highlight clear ColorColumn')
vim.cmd('colorscheme kanagawa')
