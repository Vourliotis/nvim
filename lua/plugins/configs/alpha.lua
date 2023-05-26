local success, alpha = pcall(require, 'alpha')

if not success then
  return
end

local ascii = {
  '                                                              ',
  '    ⢀⣀⣤⣤⣤⠤⢤⣤⣤⣤⣤⣄⣀⡀           ⢀⣠⣤⣄⡀            ⣀⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⡀   ',
  ' ⢀⣤⠚⠩⠁⡄ ⠠⣤⠒⠒⣂ ⢈⣨⣭⣿⠛⠶⣦⣤⣄⡀   ⢠⣾⡟⠉⠉⠝⠿⠇    ⢀⣠⡤⠔⠒⣻⠟⠋⠩⠉⢁⣀⡀  ⣶  ⠙⡛⠷  ',
  ' ⠸⢟⡠⠒⢊⡤  ⠋⣠ ⠈⣉⣉⣉⣉⣀⣛⣿⡒⠭⡿⢿⣷⣤⣤⣀⣽⣇⣴⠆⣴⡃⢀⣠⣤⠴⣚⣫⡥ ⠒⠛⠁⣀⣉⣉⣙⢏⡉  ⢀⣼⣤⣜⠳⡦⠂  ',
  '   ⠐⠚⠫⣤⠖⢣⣤⡕ ⠉⣩⣤⠔ ⠂⣋⣭⣥⣤⠴⠛⣛⠈⢩⣿⠿⠛⢉  ⡐⠞⠫⢍⠙⣓⠢⠴⣥⣍⣙⠛⢓⡢⢤⣬⠉⠅ ⣤⡜⢛⠻⠛⠉⠁   ',
  '      ⠘⢔⢎⣡⡔⠂⣠⡿⠁⠒⢛⡻⢛⣩⠅  ⠉  ⠚⣯⣄⢠⣿⢀⣾⠇ ⠓ ⠁⠂⠈⠍⠐⠈⡉⣿⠛⣛⠛⠉⣤⣰⣿⣿⡟⠛⠁      ',
  '        ⠙⠛⠐⠚⠋ ⠒⣲⡿⠇⣋        ⢺⡏⠈⣀ ⠉⠈        ⠙⢿⠟⢰⣖⡢ ⠂⠒⠚⠉         ',
  '             ⣴⠛⠅⢀⣾⠟⢃       ⢹⠃⠠⠁⠈⠩         ⢠⣿ ⣀⢹⣿⡷             ',
  '             ⢿⣤⢚⣫⠅         ⢸⠇ ⢚ ⢀         ⣸⡇ ⠉⣿⣿⠇             ',
  '             ⠈⠛⢻⣥⡚⠔⣠⢣⣄⡀    ⢸⡇ ⢘ ⠈ ⠠⠈    ⣀⣰⡿⣧⣄⠾⠋⠁              ',
  '                ⠈⠑⠁        ⠘⣿⡀⣈⣀    ⠈  ⠈⠙⠁                    ',
  '                            ⠘⣷⠁                               ',
  '                             ⠙⣤                               ',
  '                              ⠛⠂                              ',
  '                                                              ',
}

local header = {
  type = 'text',
  val = ascii,
  opts = {
    position = 'center',
    hl = 'AlphaHeader',
  },
}

local dashboard = require('alpha.themes.dashboard')
local buttons = {
  type = 'group',
  val = {
    dashboard.button('f', '  Find File', '<CMD>Telescope find_files<CR>'),
    dashboard.button('w', '  Find Word', '<CMD>Telescope live_grep_args<CR>'),
    dashboard.button('r', '  Recent File', '<CMD>Telescope oldfiles<CR>'),
    dashboard.button('u', '  Update Plugins', '<CMD>Lazy sync<CR>'),
    dashboard.button('c', '  Config', ':e $MYVIMRC | :cd %:p:h <CR>'),
  },
  opts = {
    spacing = 1,
  },
}

local dynamic_header_padding = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.3) })

alpha.setup({
  layout = {
    { type = 'padding', val = dynamic_header_padding },
    header,
    { type = 'padding', val = 2 },
    buttons,
  },
  opts = {},
})
