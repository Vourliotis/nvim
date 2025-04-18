return {
  'ibhagwan/fzf-lua',
  keys = {
    { '<LEADER>ff', '<CMD>FzfLua files<CR>', mode = 'n' },
    { '<LEADER>fp', '<CMD>FzfLua resume<CR>', mode = 'n' },
    { '<LEADER>fw', '<CMD>FzfLua live_grep_glob<CR>', mode = 'n' },
    { '<LEADER>fb', '<CMD>FzfLua buffers<CR>', mode = 'n' },
    { '<LEADER>fr', '<CMD>FzfLua live_grep_resume<CR>', mode = 'n' },
    { '<LEADER>fz', '<CMD>FzfLua<CR>', mode = 'n' },
  },
  opts = {
    fzf_colors = {
      true,
      ['fg'] = { 'fg', 'CursorLine' },
      ['bg'] = { 'bg', 'Normal' },
      ['hl'] = { 'fg', 'Comment' },
      ['fg+'] = { 'fg', 'Normal', 'underline' },
      ['bg+'] = { 'bg', { 'CursorLine', 'Normal' } },
      ['hl+'] = { 'fg', 'Statement' },
      ['info'] = { 'fg', 'PreProc' },
      ['prompt'] = { 'fg', 'Conditional' },
      ['pointer'] = { 'fg', 'Exception' },
      ['marker'] = { 'fg', 'Keyword' },
      ['spinner'] = { 'fg', 'Label' },
      ['header'] = { 'fg', 'Comment' },
      ['gutter'] = '-1',
    },
  },
}
