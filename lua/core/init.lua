-- Detect OS and set nvim home as global variable
if vim.fn.has('unix') == 1 then
  vim.g['nvim_home'] = '~/.config/nvim'
elseif vim.fn.has('win32') == 1 then
  vim.g['nvim_home'] = '~/AppData/Local/nvim'
end

-- Source NeoVim files after save
vim.cmd('autocmd BufWritePost */nvim/** source %')

require 'core.keymaps'
require 'core.options'
