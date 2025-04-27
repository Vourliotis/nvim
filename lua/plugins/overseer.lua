return {
  'stevearc/overseer.nvim',
  keys = {
    { '<LEADER>ot', '<CMD>OverseerToggle<CR>', mode = 'n' },
    { '<LEADER>or', '<CMD>OverseerRun<CR>', mode = 'n' },
    { '<LEADER>ok', '<CMD>OverseerQuickAction<CR>', mode = 'n' },
    { '<LEADER>oa', '<CMD>OverseerTaskAction<CR>', mode = 'n' },
  },
  opts = {
    templates = { 'builtin', 'bazel' },
    default_neotest = {
      { 'on_complete_notify', on_change = true },
      'default',
    },
  },
}
