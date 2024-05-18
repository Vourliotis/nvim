return {
  {
    'L3MON4D3/LuaSnip',
    cond = vim.fn.executable('make') == 1 and not vim.g.vscode,
    build = 'make install_jsregexp',
    event = 'InsertEnter',
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
    'nvim-cmp',
    optional = true,
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function(_, opts)
      local luasnip = require('luasnip')

      table.insert(opts, {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
      })

      table.insert(opts.sources, 3, {
        name = 'luasnip',
      })
    end,
  },
}
