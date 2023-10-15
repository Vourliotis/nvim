local function get_color(group, attr)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end

local M = {}

M.separators = {
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

M.colors = {
  fg = get_color('Normal', 'fg'),
  bg = get_color('Normal', 'bg'),
  status_line_fg = get_color('StatusLine', 'fg'),
  status_line_bg = get_color('StatusLine', 'bg'),
  success = get_color('diffAdded', 'fg'),
  error = get_color('diffRemoved', 'fg'),
  warning = get_color('diffChanged', 'fg'),
  info = get_color('DiagnosticInfo', 'fg'),
}

M.conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
}

return M
