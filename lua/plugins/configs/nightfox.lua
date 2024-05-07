local palettes = {
  nightfox = {
    bg0 = '#1e2030',
    bg1 = '#24273a',
    bg2 = '#363a4f',
    bg3 = '#3e445e',
    bg4 = '#4c5373',
    sel0 = '#3e445e',
  },
}

local groups = {
  nightfox = {
    ['@variable.member'] = { fg = 'palette.orange.bright' },
    CursorLine = { bg = 'palette.bg2' },
    StatusLine = { bg = 'palette.bg2' },
    BufferLineFill = { bg = 'palette.bg0' },
  },
}

require('nightfox').setup({ palettes = palettes, groups = groups })
