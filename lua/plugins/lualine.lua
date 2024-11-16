return {
  'nvim-lualine/lualine.nvim',
  opts = function()
    local utils = require('ui.utils')

    return {
      options = {
        globalstatus = true,
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = {
          {
            function()
              return '%z{}'
            end,
            separator = { right = utils.separators.right },
            color = { bg = utils.colors.success },
            padding = { right = 0 },
          },
          {
            function()
              return '%z{}'
            end,
            separator = { right = utils.separators.right },
            color = { bg = utils.colors.warning },
            padding = { right = 0 },
          },
          {
            function()
              return '%z{}'
            end,
            separator = { right = utils.separators.right },
            color = { bg = utils.colors.error },
            padding = { right = 0 },
          },
        },
        lualine_b = {
          {
            'filetype',
            icon_only = true,
            separator = '',
            cond = utils.conditions.buffer_not_empty,
            color = { bg = utils.colors.bg },
            padding = { left = 1, right = 0 },
          },
          {
            'filename',
            path = 1,
            separator = { right = utils.separators.right },
            cond = utils.conditions.buffer_not_empty,
            color = { bg = utils.colors.bg, fg = utils.colors.fg },
          },
        },
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
              color_error = { fg = utils.colors.error },
              color_warn = { fg = utils.colors.warning },
              color_info = { fg = utils.colors.info },
            },
            separator = { right = utils.separators.bar_small },
          },
        },
        lualine_x = {
          {
            'diff',
            symbols = { added = '+', modified = '~', removed = '-' },
            diff_color = {
              added = { fg = utils.colors.success, gui = 'bold' },
              modified = { fg = utils.colors.warning, gui = 'bold' },
              removed = { fg = utils.colors.error, gui = 'bold' },
            },
            separator = { left = utils.separators.left },
            color = { bg = utils.colors.bg },
          },
        },
        lualine_y = {
          {
            function()
              return '%z{}'
            end,
            separator = { left = utils.separators.left },
            color = { bg = utils.colors.error },
            padding = { left = 0 },
          },
          {
            function()
              return '%z{}'
            end,
            separator = { left = utils.separators.left },
            color = { bg = utils.colors.warning },
            padding = { left = 0 },
          },
          {
            function()
              return '%z{}'
            end,
            separator = { left = utils.separators.left },
            color = { bg = utils.colors.success },
            padding = { left = 0 },
          },
        },
        lualine_z = {},
      },
    }
  end,
}
