local success, lualine = pcall(require, 'lualine')

if not success then
  return
end

local utils = require('ui.utils')

local config = {
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
        color = { bg = utils.colors.bg },
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
        function()
          return require('gitblame').get_current_blame_text()
        end,
        cond = require('gitblame').is_blame_text_available,
      },
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
          local icon = ''
          local status = require('copilot.api').status.data
          return icon .. (status.message or '')
        end,
        cond = function()
          local ok, clients = pcall(vim.lsp.get_active_clients, { name = 'copilot', bufnr = 0 })
          return ok and #clients > 0
        end,
        color = function()
          if not package.loaded['copilot'] then
            return
          end

          local copilot_colors = {
            [''] = utils.colors.fg,
            ['Normal'] = utils.colors.fg,
            ['Warning'] = utils.colors.error,
            ['InProgress'] = utils.colors.warning,
          }

          local status = require('copilot.api').status.data.status

          return { fg = copilot_colors[status] }
        end,
      },
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

lualine.setup(config)
