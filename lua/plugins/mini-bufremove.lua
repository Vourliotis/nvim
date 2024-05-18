return {
  'echasnovski/mini.bufremove',
  lazy = false,
  keys = {
    {
      '<C-w>',
      function()
        local bd = require('mini.bufremove').delete

        if not vim.bo.modified then
          bd(0)
          return
        end

        local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')

        if choice == 1 then
          vim.cmd.write()
          bd(0)
        elseif choice == 2 then
          bd(0, true)
        end
      end,
    },
    {
      '<A-w>',
      function()
        require('mini.bufremove').delete(0, true)
      end,
    },
  },
  config = function()
    vim.keymap.del('n', '<C-w>d')
    vim.keymap.del('n', '<C-w><C-d>')
  end,
}
