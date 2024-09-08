return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.icons',
  },
  opts = {
    render_modes = { 'n', 'c', 'i', 'v', 'V', 't', 'no' },
    heading = {
      sign = false,
      icons = {},
    },
    code = { border = 'thick' },
  },
}
