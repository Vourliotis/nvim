local success, bufferline = pcall(require, 'bufferline')

if not success then
  return
end

bufferline.setup {
  animation = false,
  closable = false,
  icon_separator_active = '',
  icon_separator_inactive = '',
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

nvim_tree_events.on_tree_open(function()
  bufferline_api.set_offset(26, 'File Tree')
end)

nvim_tree_events.on_tree_close(function()
  bufferline_api.set_offset(0)
end)
