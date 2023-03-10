local vscode = require('core.utils').vscode

return {
  {
    'akinsho/git-conflict.nvim',
    cond = not vscode,
    lazy = false,
    config = function()
      require('git-conflict').setup()
    end,
  },
  {
    'tanvirtin/vgit.nvim',
    cond = not vscode,
    keys = {
      { '<LEADER>gd', '<CMD>VGit buffer_diff_preview<CR>', mode = 'n' },
      { '<LEADER>gh', '<CMD>VGit buffer_history_preview<CR>', mode = 'n' },
      { '<C-]>', '<CMD>VGit hunk_down<CR>', mode = 'n' },
      { '<C-[>', '<CMD>VGit hunk_up<CR>', mode = 'n' },
      { '<LEADER>gb', '<CMD>VGit toggle_live_blame<CR>', mode = 'n' },
    },
    config = function()
      require('plugins.configs.vgit')
    end,
  },
}
