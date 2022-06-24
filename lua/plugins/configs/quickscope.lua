-- Trigger a highlight in the appropriate direction when pressing the defined keys
vim.cmd([[ let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] ]])

vim.g.qs_max_chars = 150

vim.cmd([[
  highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
]])
