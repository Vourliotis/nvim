local function nocode()
  return vim.fn.exists('g:vscode') == 0
end

local plugins = {
  ['nvim-lua/plenary.nvim'] = {},

  ["lewis6991/impatient.nvim"] = {},

  -- ["wbthomason/packer.nvim"] = {},

  -- Fixes sequencing of optional plugins
  ['ifplusor/packer.nvim'] = {
    branch = 'fix-sequencing'
  },

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

  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    cond = nocode,
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

  ['goolord/alpha-nvim'] = {
    cond = nocode,
    config = function()
      require 'plugins.configs.alpha'
    end
  },

  ['lukas-reineke/indent-blankline.nvim'] = {
    cond = nocode,
    config = function()
      require 'plugins.configs.blankline'
    end
  },

  ['akinsho/bufferline.nvim'] = {
    tag = 'v2.*',
    cond = nocode,
    config = function()
      require 'plugins.configs.bufferline'
    end
  },

  ['nvim-lualine/lualine.nvim'] = {
    cond = nocode,
    after = 'git-blame.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'f-person/git-blame.nvim'
    },
    config = function()
      require 'plugins.configs.lualine'
    end
  },

  ['tanvirtin/vgit.nvim'] = {
    cond = nocode,
    config = function()
      require 'plugins.configs.vgit'
    end
  },

  ['akinsho/toggleterm.nvim'] = {
    cond = nocode,
    tag = 'v1.*',
    config = function()
      require 'plugins.configs.toggleterm'
    end
  }
}

require("core.packer").run(plugins)
