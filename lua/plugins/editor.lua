local vscode = require('core.utils').vscode

return {
  {
    'phaazon/hop.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', '<CMD>HopChar2<CR>', mode = { 'n', 'v' } },
    },
  },
  {
    'numToStr/Comment.nvim',
    cond = not vscode,
    keys = {
      { '<C-_>', 'gcc', mode = 'n', remap = true },
      { '<C-/>', 'gcc', mode = 'n', remap = true },
      { '<C-_>', 'gcgv', mode = 'v', remap = true },
      { '<C-/>', 'gcgv', mode = 'v', remap = true },
    },
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'folke/todo-comments.nvim',
    cond = not vscode,
    event = 'BufEnter',
    config = function()
      require('todo-comments').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    cond = not vscode,
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      { '<leader>df', '<cmd>TroubleToggle document_diagnostics<cr>' },
      { '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<cr>' },
    },
  },
}
