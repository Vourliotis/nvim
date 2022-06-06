--  _       _ _     _             
-- (_)_ __ (_) |_  | |_   _  __ _ 
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|

require 'core'
require 'plugins'

-- VSCode only settings
if vim.g.vscode then
 vim.cmd("exec 'source' g:nvim_home.'/vscode/settings.vim'")
end
