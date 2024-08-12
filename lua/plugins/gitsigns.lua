return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
      },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    optional = true,
    opts = function(_, opts)
      return require('core.utils').extend_tbl(
        opts,
        { groups = { nightfox = { GitSignsCurrentLineBlame = { fg = 'palette.fg3' } } } }
      )
    end,
  },
}
