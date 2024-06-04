return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  keys = {
    { '<leader>df', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>' },
    { '<leader>dw', '<CMD>Trouble diagnostics toggle<CR>' },
  },
  opts = {},
}
