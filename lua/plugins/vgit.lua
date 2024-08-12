return {
  'tanvirtin/vgit.nvim',
  keys = {
    { '<LEADER>gd', '<CMD>VGit buffer_diff_preview<CR>', mode = 'n' },
    { '<LEADER>gh', '<CMD>VGit buffer_history_preview<CR>', mode = 'n' },
    { '<LEADER>gn', '<CMD>VGit hunk_down<CR>', mode = 'n' },
    { '<LEADER>gp', '<CMD>VGit hunk_up<CR>', mode = 'n' },
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
