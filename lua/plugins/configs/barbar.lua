local success, bufferline = pcall(require, 'bufferline')

if not success then
  return
end

bufferline.setup({
  animation = false,
  icons = {
    button = false,
    separator = { left = '' },
    inactive = {
      separator = { left = '' },
    },
    modified = { button = false },
    pinned = { button = '車', filename = true },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(tbl)
    local set_offset = require('bufferline.api').set_offset

    local bufwinid
    local last_width
    local autocmd = vim.api.nvim_create_autocmd('WinScrolled', {
      callback = function()
        bufwinid = bufwinid or vim.fn.bufwinid(tbl.buf)

        local width = vim.api.nvim_win_get_width(bufwinid)
        if width ~= last_width then
          set_offset(width + 1, 'FileTree')
          last_width = width
        end
      end,
    })

    vim.api.nvim_create_autocmd('BufWipeout', {
      buffer = tbl.buf,
      callback = function()
        vim.api.nvim_del_autocmd(autocmd)
        set_offset(0)
      end,
      once = true,
    })
  end,
  pattern = 'NvimTree',
})
