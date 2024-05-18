return {
  {
    'phaazon/hop.nvim',
    event = 'VeryLazy',
    vscode = true,
    opts = {},
    keys = {
      { 's', '<CMD>HopChar2<CR>', mode = { 'n', 'v' } },
    },
  },
  {
    'stevearc/conform.nvim',
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
    keys = {
      { '<C-_>', 'gcc', mode = 'n', remap = true },
      { '<C-/>', 'gcc', mode = 'n', remap = true },
      { '<C-_>', 'gcgv', mode = 'v', remap = true },
      { '<C-/>', 'gcgv', mode = 'v', remap = true },
    },
    opts = {},
  },
  {
    'folke/todo-comments.nvim',
    event = 'BufEnter',
    opts = {},
  },
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      { '<leader>df', '<cmd>TroubleToggle document_diagnostics<cr>' },
      { '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<cr>' },
    },
  },
  {
    'echasnovski/mini.bufremove',
    lazy = false,
    keys = {
      {
        '<C-w>',
        function()
          local bd = require('mini.bufremove').delete

          if vim.bo.modified then
            local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')

            -- Yes
            if choice == 1 then
              vim.cmd.write()
              bd(0)
            -- No
            elseif choice == 2 then
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
      },
      {
        '<A-w>',
        function()
          require('mini.bufremove').delete(0, true)
        end,
      },
    },
  },
}
