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
    'stevearc/conform.nvim',
    cond = not vscode,
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        scss = { { 'prettierd', 'prettier' } },
      },
    },
    keys = {
      {
        "<leader>'f",
        function()
          require('conform').format({ lsp_fallback = true })
        end,
        mode = 'n',
      },
    },
  },
  {
    'mfussenegger/nvim-lint',
    cond = not vscode,
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
    opts = {
      events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
      linters_by_ft = {
        css = { 'stylelint' },
        scss = { 'stylelint' },
      },
    },
    config = function(_, opts)
      require('lint').linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
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
