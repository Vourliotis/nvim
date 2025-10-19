return {
  'nvim-treesitter/nvim-treesitter',
  vscode = true,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    {
      'RRethy/nvim-treesitter-endwise',
      opts = { endwise = { enable = true } },
      config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
      end,
    },
    {
      'windwp/nvim-ts-autotag',
      event = 'InsertEnter',
      opts = {},
    },
  },
  opts = {
    ensure_installed = {
      'ruby',
      'go',
      'javascript',
      'lua',
      'vim',
      'vimdoc',
      'html',
      'css',
      'scss',
      'markdown',
      'markdown_inline',
      'java',
      'typescript',
      'tsx',
      'xml',
      'sql',
      'terraform',
    },
    highlight = {
      enable = true,
    },
    playground = {
      enable = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']f'] = '@function.outer',
          [']b'] = '@block.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']B'] = '@block.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[b'] = '@block.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[B'] = '@block.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
