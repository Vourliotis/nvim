require'bufferline'.setup {
  animation = false,
  auto_hide = false,
  tabpages = true,
  closable = false,
  clickable = true,
  exclude_ft = {},
  exclude_name = {},
  icons = true,
  icon_custom_colors = false,
  -- icon_separator_active = '▎',
  -- icon_separator_inactive = '▎',
  icon_separator_active = '',
  icon_separator_inactive = '',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline = require('bufferline.api')

nvim_tree_events.on_tree_open(function ()
  bufferline.set_offset(26, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline.set_offset(0)
end)
