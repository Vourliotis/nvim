return {
  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    opts = {
      keymap = { preset = 'super-tab' },
      fuzzy = { implementation = "lua" },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    optional = true,
    opts = function(_, opts)
      return require('core.utils').extend_tbl(opts, {
        groups = {
          nightfox = {
            BlinkCmpMenu = { bg = 'palette.bg1' },
            Pmenu = { bg = 'palette.bg1' },
            BlinkCmpDoc = { bg = 'palette.bg1' },
            NormalFloat = { bg = 'palette.bg1' },
          },
        },
      })
    end,
  },
}
