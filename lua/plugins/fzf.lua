return {
  {
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
      winopts = { backdrop = 100 },
      files = { previewer = false },
      fzf_colors = true,
      fzf_opts = { ['--border'] = false },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    optional = true,
    opts = function(_, opts)
      return require('core.utils').extend_tbl(opts, {
        groups = {
          nightfox = {
            FzfLuaBorder = { fg = 'palette.bg3' },
          },
        },
      })
    end,
  },
}
