return {
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require('plugins.configs.alpha')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'f-person/git-blame.nvim',
        keys = {
          { '<LEADER>gu', '<CMD>GitBlameOpenCommitURL<CR>', mode = 'n' },
        },
        config = function()
          vim.g.gitblame_display_virtual_text = 0
          vim.g.gitblame_date_format = '%r'
        end,
      },
      { 'folke/noice.nvim' },
    },
    config = function()
      require('plugins.configs.lualine')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<C-p>', '<Cmd>BufferLineTogglePin<CR>', mode = 'n' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', mode = 'n' },
      { '<Tab>', '<cmd>BufferLineCycleNext<cr>', mode = 'n' },
      { '<S-h>', '<CMD>BufferLineMovePrev<CR>', mode = 'n' },
      { '<S-l>', '<CMD>BufferLineMoveNext<CR>', mode = 'n' },
    },
    opts = function(_, opts)
      local bufferline = require('bufferline')

      opts.options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        style_preset = {
          bufferline.style_preset.no_italic,
        },
        indicator = { style = 'none' },
        custom_filter = function(buf_number, _)
          if vim.fn.bufname(buf_number) ~= '' then
            return true
          end
        end,
      }
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = { scope = { enabled = false } },
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'alpha', 'dashboard', 'terminal', 'lazy', 'mason' },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function()
      require('mini.indentscope').setup({
        draw = { animation = require('mini.indentscope').gen_animation.none() },
        options = { try_as_border = true },
        symbol = '▏',
      })
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
    end,
  },
  {
    'lukas-reineke/virt-column.nvim',
    config = function()
      require('virt-column').setup({
        char = '▕',
      })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
}
