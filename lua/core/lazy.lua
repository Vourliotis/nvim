local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
  require('code.lazy')
end

require('lazy').setup({ spec = {
  { import = 'plugins' },
  { import = 'plugins.after' },
} })

vim.keymap.set('n', '<LEADER>l', '<CMD>Lazy<CR>')
