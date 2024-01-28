local groups = {
  nightfox = {
    ['@variable.member'] = { fg = 'palette.orange.bright' },
    BufferCurrent = { bg = 'palette.bg1', style = 'bold' },
    BufferCurrentMod = { bg = 'palette.bg1', style = 'bold' },
    StatusLine = { bg = 'palette.bg2' },
  },
}

require('nightfox').setup({ groups = groups })
