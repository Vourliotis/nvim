return {
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
  opts = function()
    return {
      draw = { animation = require('mini.indentscope').gen_animation.none() },
      options = { try_as_border = true },
      symbol = '▏',
    }
  end,
}
