local success, barbar = pcall(require, 'barbar')

if not success then
  return
end

barbar.setup({
  animation = false,
  icons = {
    button = false,
    separator = { left = '' },
    inactive = {
      separator = { left = '' },
    },
    modified = { button = false },
    pinned = { button = '車', filename = true },
  },
  sidebar_filetypes = {
    NvimTree = true,
  },
})
