local function nocode()
  return vim.fn.exists('g:vscode') == 0
end

local plugins = {
  ["lewis6991/impatient.nvim"] = {},

  ["wbthomason/packer.nvim"] = {},

  ['phaazon/hop.nvim'] = {
    config = function()
      require('plugins.configs.hop')
    end
  },

  ['unblevable/quick-scope'] = {
    config = function()
      require('plugins.configs.quickscope')
    end
  },

  ['preservim/nerdcommenter'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.nerdcommenter')
    end,
  },

  ['https://gitlab.com/__tpb/monokai-pro.nvim'] = {
    cond = nocode,
    as = 'monokai-pro.nvim',
    config = function()
      require('plugins.configs.monokaipro')
    end
  },

   ['nvim-treesitter/nvim-treesitter'] = {
    cond = nocode,
    run = ':TSUpdate',
    config = function()
       require 'plugins.configs.treesitter'
    end
  },
}

require("core.packer").run(plugins)
