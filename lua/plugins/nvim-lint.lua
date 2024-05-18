return {
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
}
