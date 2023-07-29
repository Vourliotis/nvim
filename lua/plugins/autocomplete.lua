local vscode = require('core.utils').vscode

return {
  {
    'L3MON4D3/LuaSnip',
    cond = not vscode,
    event = 'InsertEnter',
    build = 'make installl_jsregexp',
    dependencies = {
      {
        'rafamadriz/friendly-snippets',
        config = function()
          require('luasnip').filetype_extend('ruby', { 'rails' })
        end,
      },
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip').config.set_config({
        history = false,
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    cond = not vscode,
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins.configs.autopairs')
        end,
      },
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
    config = function()
      require('plugins.configs.cmp')
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cond = not vscode,
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
}
