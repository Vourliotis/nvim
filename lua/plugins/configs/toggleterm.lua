local success, toggleterm = pcall(require, 'toggleterm')

if not success then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  direction = 'vertical',
  size = vim.o.columns * 0.4,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})
