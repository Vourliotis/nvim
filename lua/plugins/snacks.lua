return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<LEADER>e',
      function()
        Snacks.explorer()
      end,
    },
  },
  opts = {
    explorer = { enabled = true },
  },
}
