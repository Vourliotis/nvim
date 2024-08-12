-- Load plugins only when in VSCode by setting the `vscode` plugin field to `true`.
-- When a plugin declares its own `cond` field, it will overwrite the default,
-- which means VSCode needs to be explicitly excluded.
local defaults = require('lazy.core.config').defaults

defaults.defaults = {
  cond = function(plugin)
    return plugin.vscode
  end,
}
