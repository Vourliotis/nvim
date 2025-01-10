return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  opts = {
    options = {
      styles = {
        keywordds = 'bold',
        types = 'bold',
      },
    },
    palettes = {
      nightfox = {
        bg0 = '#1e2030',
        bg1 = '#24273a',
        bg2 = '#363a4f',
        bg3 = '#3e445e',
        bg4 = '#4c5373',
        sel0 = '#3e445e',
      },
    },
    groups = {
      nightfox = {
        ['@variable.member'] = { fg = 'palette.orange.bright' },
        ['@module'] = { fg = 'palette.yellow.base' },
        ['@property'] = { fg = 'palette.orange.bright' },
        CursorLine = { bg = 'palette.bg2' },
        StatusLine = { bg = 'palette.bg2' },
      },
    },
  },
  config = function(_, opts)
    require('nightfox').setup(opts)
    vim.cmd('colorscheme nightfox')
  end,
}
