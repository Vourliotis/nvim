return {
  'goolord/alpha-nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = function()
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

    local dashboard = require('alpha.themes.dashboard')

    local header = {
      type = 'text',
      val = ascii,
      opts = { position = 'center' },
    }

    local buttons = {
      type = 'group',
      val = {
        dashboard.button('f', '  Find File', '<CMD>Telescope find_files<CR>'),
        dashboard.button('w', '󰺯  Find Word', '<CMD>Telescope live_grep_args<CR>'),
        dashboard.button('r', '󰔠  Recent File', '<CMD>Telescope oldfiles<CR>'),
        dashboard.button('u', '  Update Plugins', '<CMD>Lazy sync<CR>'),
      },
      opts = { spacing = 1 },
    }

    local dynamic_header_padding = vim.fn.max({ 1, vim.fn.floor(vim.fn.winheight(0) * 0.2) })

    return {
      layout = {
        { type = 'padding', val = dynamic_header_padding },
        header,
        { type = 'padding', val = 2 },
        buttons,
      },
      opts = {},
    }
  end,
  config = function(_, opts)
    require('alpha').setup(opts)

    vim.api.nvim_create_autocmd('TabNewEntered', {
      desc = 'Open Alpha when creating a new tab',
      callback = function()
        vim.cmd('Alpha')
      end,
    })
  end,
}
