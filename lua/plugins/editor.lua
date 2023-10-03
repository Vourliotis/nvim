local vscode = require('core.utils').vscode

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
      label = {
        uppercase = false,
        after = false,
        before = true,
      },
    },
    keys = {
      {
        's',
        mode = { 'n', 'o', 'x' },
        function()
          require('flash').jump()
        end,
      },
      {
        'S',
        mode = { 'n', 'o', 'x' },
        function()
          require('flash').treesitter()
        end,
      },
    },
  },
  {
    'numToStr/Comment.nvim',
    cond = not vscode,
    keys = {
      { '<C-_>', 'gcc', mode = 'n', remap = true },
      { '<C-_>', 'gcgv', mode = 'v', remap = true },
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
