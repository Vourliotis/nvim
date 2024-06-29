return {
  'smoka7/hop.nvim',
  vscode = true,
  version = '*',
  keys = {
    {
      's',
      function()
        require('hop').hint_char2()
      end,
      mode = { 'n', 'v' },
    },
  },
  opts = {},
}
