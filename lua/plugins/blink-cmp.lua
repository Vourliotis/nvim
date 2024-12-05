return {
  {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',
    opts = {
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'normal',
      accept = { auto_brackets = { enabled = true } },
      trigger = { signature_help = { enabled = true } },
      keymap = { preset = 'super-tab' },
      windows = {
        autocomplete = {
          border = 'single',
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
          border = 'single',
        },
      },
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
