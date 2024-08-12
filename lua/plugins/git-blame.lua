return {
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
    keys = {
      { '<LEADER>gu', '<CMD>GitBlameOpenCommitURL<CR>', mode = 'n' },
    },
    opts = {
      enabled = false,
    },
  },
}
