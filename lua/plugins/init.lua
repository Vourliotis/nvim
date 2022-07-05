local function nocode()
  return vim.fn.exists('g:vscode') == 0
end

local plugins = {
  ['nvim-lua/plenary.nvim'] = {},

  ['lewis6991/impatient.nvim'] = {},

  -- ["wbthomason/packer.nvim"] = {},

  -- Fixes sequencing of optional plugins
  ['ifplusor/packer.nvim'] = {
    branch = 'fix-sequencing',
  },

  ['phaazon/hop.nvim'] = {
    config = function()
      require('plugins.configs.hop')
    end,
  },

  ['unblevable/quick-scope'] = {
    config = function()
      require('plugins.configs.quickscope')
    end,
  },

  ['kyazdani42/nvim-web-devicons'] = {
    cond = nocode,
  },

  ['f-person/git-blame.nvim'] = {
    cond = nocode,
    setup = function()
      vim.g.gitblame_date_format = '%r'
      vim.g.gitblame_message_template = '<author>, <date>'
      vim.g.gitblame_display_virtual_text = 0
    end,
  },

  ['akinsho/git-conflict.nvim'] = {
    cond = nocode,
    config = function()
      require('git-conflict').setup()
    end
  },

  ['numToStr/Comment.nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.comment')
    end,
  },

  ['rebelot/kanagawa.nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.kanagawa')
    end,
  },

  ['nvim-treesitter/nvim-treesitter'] = {
    cond = nocode,
    run = ':TSUpdate',
    config = function()
      require('plugins.configs.treesitter')
    end,
  },

  ['nvim-telescope/telescope.nvim'] = {
    cond = nocode,
    cmd = 'Telescope',
    config = function()
      require('plugins.configs.telescope')
    end,
  },

  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    cond = nocode,
    run = 'make',
  },

  ['kyazdani42/nvim-tree.lua'] = {
    cond = nocode,
    after = 'nvim-web-devicons',
    config = function()
      require('plugins.configs.nvimtree')
    end,
  },

  ['goolord/alpha-nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.alpha')
    end,
  },

  ['lukas-reineke/indent-blankline.nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.blankline')
    end,
  },

  ['akinsho/bufferline.nvim'] = {
    tag = 'v2.*',
    cond = nocode,
    config = function()
      require('plugins.configs.bufferline')
    end,
  },

  ['nvim-lualine/lualine.nvim'] = {
    cond = nocode,
    after = { 'nvim-web-devicons', 'git-blame.nvim' },
    config = function()
      require('plugins.configs.lualine')
    end,
  },

  ['tanvirtin/vgit.nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.vgit')
    end,
  },

  ['akinsho/toggleterm.nvim'] = {
    cond = nocode,
    tag = 'v1.*',
    config = function()
      require('plugins.configs.toggleterm')
    end,
  },

  ['rafamadriz/friendly-snippets'] = {
    cond = nocode,
    event = 'InsertEnter',
  },

  ['hrsh7th/nvim-cmp'] = {
    cond = nocode,
    after = 'friendly-snippets',
    config = function()
      require('plugins.configs.cmp')
    end,
  },

  ['L3MON4D3/LuaSnip'] = {
    cond = nocode,
    after = 'nvim-cmp',
    config = function()
      require('plugins.configs.luasnip')
    end,
  },

  ['saadparwaiz1/cmp_luasnip'] = {
    cond = nocode,
    after = 'LuaSnip',
  },

  ['hrsh7th/cmp-nvim-lua'] = {
    cond = nocode,
    after = 'cmp_luasnip',
  },

  ['hrsh7th/cmp-nvim-lsp'] = {
    cond = nocode,
    after = 'cmp-nvim-lua',
  },

  ['hrsh7th/cmp-buffer'] = {
    cond = nocode,
    after = 'cmp-nvim-lsp',
  },

  ['hrsh7th/cmp-path'] = {
    cond = nocode,
    after = 'cmp-buffer',
  },

  ['windwp/nvim-autopairs'] = {
    cond = nocode,
    after = 'cmp-path',
    config = function()
      require('plugins.configs.autopairs')
    end,
  },

  ['RRethy/nvim-treesitter-endwise'] = {
    cond = nocode,
    after = 'nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({ endwise = { enable = true } })
    end,
  },

  ['neovim/nvim-lspconfig'] = {
    cond = nocode,
    after = 'cmp-path',
  },

  ['williamboman/nvim-lsp-installer'] = {
    cond = nocode,
    after = 'nvim-lspconfig',
    config = function()
      require('lsp')
    end,
  },

  ['jose-elias-alvarez/null-ls.nvim'] = {
    cond = nocode,
    after = 'nvim-lsp-installer',
    config = function()
      require('plugins.configs.null-ls')
    end,
  },

  ['norcalli/nvim-colorizer.lua'] = {
    cond = nocode,
    config = function()
      require('colorizer').setup()
    end,
  },
}

require('core.packer').run(plugins)
