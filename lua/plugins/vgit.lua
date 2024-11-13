return {
  'tanvirtin/vgit.nvim',
  keys = {
    {
      'gk',
      function()
        require('vgit').hunk_up()
      end,
      mode = 'n',
    },
    {
      'gj',
      function()
        require('vgit').hunk_down()
      end,
      mode = 'n',
    },
    {
      '<LEADER>gh',
      function()
        require('vgit').buffer_history_preview()
      end,
      mode = 'n',
    },
    {
      '<LEADER>gs',
      function()
        require('vgit').buffer_diff_preview()
      end,
      mode = 'n',
    },
  },
  opts = {
    settings = {
      live_blame = {
        enabled = false,
      },
      authorship_code_lens = {
        enabled = false,
      },
      scene = {
        diff_preference = 'split',
      },
    },
  },
}
