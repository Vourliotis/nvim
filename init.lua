--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|

if vim.fn.has('unix') == 1 then
  vim.g['nvim_home'] = '~/.config/nvim'
elseif vim.fn.has('win32') == 1 then
  vim.g['nvim_home'] = '~/AppData/Local/nvim'
end

-- General settings
vim.cmd("exec 'source' g:nvim_home.'/vim-plug/plugins.vim'")
vim.cmd("exec 'source' g:nvim_home.'/plug-config/quickscope.vim'")
vim.cmd("exec 'source' g:nvim_home.'/plug-config/hop.vim'")
require 'core'
require 'core.keymaps'
require 'core.options'

-- VSCode only settings
if vim.g.vscode then
  vim.cmd("exec 'source' g:nvim_home.'/vscode/settings.vim'")
-- TUI/GUI NeoVim only settings
else
  vim.cmd("exec 'source' g:nvim_home.'/plug-config/nerdcommenter.vim'")
  vim.cmd("exec 'source' g:nvim_home.'/plug-config/monokai-pro.vim'")
end
