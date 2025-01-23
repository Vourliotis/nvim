return {
  'echasnovski/mini.trailspace',
  lazy = false,
  version = '*',
  keys = {
    {
      '<LEADER>tl',
      function()
        local MiniTrailspace = require('mini.trailspace')
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
      end,
      mode = 'n',
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*',
      callback = function()
        if vim.bo.filetype == 'oil' then
          return
        end

        local MiniTrailspace = require('mini.trailspace')
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
      end,
    })
  end,
  opts = {},
}
