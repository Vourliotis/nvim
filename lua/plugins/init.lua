local function nocode()
  return vim.fn.exists('g:vscode') == 0
end

local plugins = {
  ['nvim-lua/plenary.nvim'] = {},

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

  ['nvim-telescope/telescope.nvim'] = {
    cond = nocode,
    cmd = 'Telescope',
    config = function()
       require 'plugins.configs.telescope'
    end
  },

  ['nvim-telescope/telescope-fzy-native.nvim'] = {
    cond = nocode,
    requires = { 'nvim-telescope/telescope.nvim' },
    run = 'make'
  },

  ['kyazdani42/nvim-tree.lua'] = {
    cond = nocode,
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require 'plugins.configs.nvimtree'
    end
  },
}

require("core.packer").run(plugins)
