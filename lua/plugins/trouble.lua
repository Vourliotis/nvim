return {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' },
  keys = {
    { '<leader>df', '<cmd>TroubleToggle document_diagnostics<cr>' },
    { '<leader>dw', '<cmd>TroubleToggle workspace_diagnostics<cr>' },
  },
  opts = { use_diagnostic_signs = true },
}
