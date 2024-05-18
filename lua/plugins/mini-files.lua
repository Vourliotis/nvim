return {
  'echasnovski/mini.files',
  version = '*',
  keys = {
    {
      '<LEADER>e',
      function()
        local MiniFiles = require('mini.files')

        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end
      end,
      mode = 'n',
    },
  },
  opts = {},
}
