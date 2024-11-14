return {
  'lewis6991/gitsigns.nvim',
  keys = {
    {
      '<LEADER>gg',
      function()
        require('gitsigns').blame_line({ full = true })
      end,
      mode = 'n',
    },
  },
  opts = {},
}
