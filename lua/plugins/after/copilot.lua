return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'nvim-cmp',
    optional = true,
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        dependencies = 'copilot.lua',
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require('copilot_cmp')
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          require('core.utils').on_attach(function(client)
            if client.name == 'copilot' then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = 'copilot',
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    optional = true,
    dependencies = 'zbirenbaum/copilot.lua',
    opts = function(_, opts)
      local utils = require('ui.utils')

      local copilot_component = {
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
      }

      table.insert(opts.sections.lualine_y, 1, copilot_component)
    end,
  },
}
