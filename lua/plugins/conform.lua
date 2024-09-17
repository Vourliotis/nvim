return {
  'stevearc/conform.nvim',
  lazy = true,
  cmd = 'ConformInfo',
  dependencies = 'mason.nvim',
  keys = {
    {
      "<leader>'f",
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = 'n',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      ruby = { 'rubocop' },
    },
  },
}
