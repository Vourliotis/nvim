--   _       _ _     _
--  (_)_ __ (_) |_  | |_   _  __ _
--  | | '_ \| | __| | | | | |/ _` |
--  | | | | | | |_ _| | |_| | (_| |
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|

require 'core'

require('core.packer').bootstrap()
require 'plugins'

-- VSCode only settings
if vim.g.vscode then
  require 'vscode'
end
