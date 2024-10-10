return {
  {
    'f-person/git-blame.nvim',
    keys = {
      { '<LEADER>gu', '<CMD>GitBlameOpenCommitURL<CR>', mode = 'n' },
    },
    config = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_schedule_event = 'CursorHold'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    opts = function(_, opts)
      local blame_component = {
        function()
          return require('gitblame').get_current_blame_text() or ''
        end,
        cond = function()
          local filetype = vim.api.nvim_buf_get_option(0, 'filetype')
          local excluded_filetypes = { 'help', 'alpha', 'dashboard', 'terminal', 'lazy', 'mason' }

          return not vim.tbl_contains(excluded_filetypes, filetype)
        end,
      }

      table.insert(opts.sections.lualine_x, 1, blame_component)
    end,
  },
}
