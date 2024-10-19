return {
  'lervag/vimtex',
  event = {
    'BufReadPre **.tex',
    'BufNewFile **.tex',
  },
  keys = {
    { '<LEADER>lc', '<CMD>VimtexCompile<CR>', mode = 'n' },
    { '<LEADER>lx', '<CMD>VimtexClean<CR>', mode = 'n' },
  },
}
