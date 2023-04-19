local success, blankline = pcall(require, 'indent_blankline')

if not success then
  return
end

blankline.setup({
  char = '▏',
  context_char = '▏',
  filetype_exclude = {
    'help',
    'terminal',
    'alpha',
    'lspinfo',
    'TelescopePrompt',
    'TelescopeResults',
    'lsp-installer',
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = false,
})
