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

  ['kyazdani42/nvim-web-devicons'] = {
    cond = nocode,
  },

  ['akinsho/git-conflict.nvim'] = {
    cond = nocode,
    config = function()
      require('git-conflict').setup()
    end,
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

  ['ThePrimeagen/harpoon'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.harpoon')
    end,
  },

  ['olimorris/persisted.nvim'] = {
    cond = nocode,
    config = function()
      require('plugins.configs.persisted')
    end,
  },

  ['nvim-telescope/telescope-live-grep-args.nvim'] = {
    cond = nocode,
  },

  ['nvim-telescope/telescope.nvim'] = {
    cond = nocode,
    cmd = 'Telescope',
    after = { 'persisted.nvim', 'harpoon', 'telescope-live-grep-args.nvim' },
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

  ['romgrk/barbar.nvim'] = {
    cond = nocode,
    after = { 'nvim-tree.lua', 'nvim-web-devicons' },
    config = function()
      require('plugins.configs.barbar')
    end,
  },

  ['nvim-lualine/lualine.nvim'] = {
    cond = nocode,
    after = { 'nvim-web-devicons', 'kanagawa.nvim' },
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
    tag = 'v2.*',
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

  ['williamboman/mason-lspconfig.nvim'] = {
    cond = nocode,
    after = 'nvim-lspconfig',
  },

  ['williamboman/mason.nvim'] = {
    cond = nocode,
    after = 'mason-lspconfig.nvim',
    config = function()
      require('lsp')
    end,
  },

  ['jose-elias-alvarez/null-ls.nvim'] = {
    cond = nocode,
    after = 'mason.nvim',
  },

  ['jayp0521/mason-null-ls.nvim'] = {
    cond = nocode,
    after = 'null-ls.nvim',
    config = function()
      require('lsp.configs.null-ls')
    end,
  },

  ['j-hui/fidget.nvim'] = {
    cond = nocode,
    config = function()
      require('fidget').setup()
    end,
  },

  ['norcalli/nvim-colorizer.lua'] = {
    cond = nocode,
    config = function()
      require('colorizer').setup()
    end,
  },

  ['petertriho/nvim-scrollbar'] = {
    cond = nocode,
    config = function()
      require('scrollbar').setup()
    end,
  },

  ['lukas-reineke/virt-column.nvim'] = {
    cond = nocode,
    config = function()
      require('virt-column').setup({
        char = '▕',
      })
    end,
  },

  ['vim-scripts/ReplaceWithRegister'] = {},
}

require('core.packer').run(plugins)
