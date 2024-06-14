return {
  'stevearc/conform.nvim',
  lazy = true,
  cmd = 'ConformInfo',
  dependencies = 'mason.nvim',
  keys = {
    {
      "<leader>'f",
      function()
        require('conform').format({ lsp_fallback = true })
      end,
      mode = 'n',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      scss = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
    },
  },
}
