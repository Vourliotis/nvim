require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.rubocop,
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.stylua,
    require('null-ls').builtins.formatting.erb_lint,
  },
})
