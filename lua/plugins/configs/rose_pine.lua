local success, rose_pine = pcall(require, 'rose-pine')

if not success then
  return
end

rose_pine.setup({
  dark_variant = 'main',
  disable_italics = true,
  highlight_groups = {
    ['@label'] = { fg = 'gold', bold = true },
    ['@symbol'] = { fg = 'foam' },
    ['@string'] = { fg = 'gold' },
    ['@keyword.return'] = { fg = 'love' },
    TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
    TelescopeNormal = { bg = 'none' },
    TelescopePromptNormal = { bg = 'base' },
    TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
    TelescopeSelection = { fg = 'text', bg = 'base' },
    TelescopeSelectionCaret = { fg = 'rose', bg = 'base' },
    diffAdded = { fg = 'pine' },
    diffRemoved = { fg = 'love' },
    diffChanged = { fg = 'iris' },
  },
})
