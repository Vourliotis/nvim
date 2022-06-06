local Plug = require 'core.vimplug'

Plug.begin(vim.g.nvim_home..'/autoload/plugged')

Plug('phaazon/hop.nvim', {
  config = function()
    require('plugins.configs.hop')
  end
})

Plug('unblevable/quick-scope', {
  config = function()
    require('plugins.configs.quickscope')
  end
})

if not vim.g.vscode then
  Plug('preservim/nerdcommenter', {
    config = function()
      require('plugins.configs.nerdcommenter')
    end
  })

  Plug('https://gitlab.com/__tpb/monokai-pro.nvim', {
    as = '__tpb/monokai-pro.nvim',
    config = function()
      require('plugins.configs.monokaipro')
    end
  })
end

Plug.ends()
