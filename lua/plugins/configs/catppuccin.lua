require('catppuccin').setup({
  background = {
    light = 'latte',
    dark = 'mocha',
  },
  color_overrides = {
    mocha = {
      base = '#171717',
      mantle = '#171717',
      text = '#F6F6F6',
    },
  },
  custom_highlights = function(colors)
    return {
      ['@label'] = { fg = colors.peach, style = { 'bold' } },
      ['@keyword.return'] = { fg = colors.red },
      BufferCurrent = { style = { 'bold' } },
      BufferCurrentMod = { fg = colors.yellow, style = { 'bold' } },
      diffAdded = { fg = colors.green },
      diffRemoved = { fg = colors.red },
      diffChanged = { fg = colors.yellow },
      DiagnosticInfo = { fg = colors.lavender },
    }
  end,
  integrations = {
    native_lsp = {
      enabled = true,
      underlines = {
        errors = { 'undercurl' },
        hints = { 'undercurl' },
        warnings = { 'undercurl' },
        information = { 'undercurl' },
      },
    },
  },
})
