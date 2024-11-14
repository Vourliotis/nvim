return {
  {
    'f-person/git-blame.nvim',
    keys = {
      { '<LEADER>gu', '<CMD>GitBlameOpenCommitURL<CR>', mode = 'n' },
    },
    config = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_schedule_event = 'CursorHold'
    end,
  },
}
