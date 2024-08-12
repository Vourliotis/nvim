--   _       _ _     _
--  (_)_ __ (_) |_  | |_   _  __ _
--  | | '_ \| | __| | | | | |/ _` |
--  | | | | | | |_ _| | |_| | (_| |
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|

require('core')
require('lsp')

-- VSCode only settings
if vim.g.vscode then
  require('code')
end
