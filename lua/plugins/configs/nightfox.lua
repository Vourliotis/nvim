local groups = {
  nightfox = {
    ['@label'] = { fg = 'palette.orange.bright' },
    ['@symbol'] = { fg = 'palette.blue' },
    ['@type'] = { fg = 'palette.yellow.bright' },
    BufferCurrent = { bg = 'palette.bg1', style = 'bold' },
    BufferCurrentMod = { bg = 'palette.bg1', style = 'bold' },
    StatusLine = { bg = 'palette.bg2' },
  },
}

require('nightfox').setup({ groups = groups })
