return {
  {
    'akinsho/bufferline.nvim',
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
    'EdenEast/nightfox.nvim',
    optional = true,
    opts = function(_, opts)
      return require('core.utils').extend_tbl(
        opts,
        { groups = { nightfox = { BufferLineFill = { bg = 'palette.bg0' } } } }
      )
    end,
  },
}
