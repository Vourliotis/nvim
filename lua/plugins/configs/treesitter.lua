local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

treesitter.setup({
  ensure_installed = {
    'ruby',
    'go',
    'rust',
    'javascript',
    'lua',
    'vim',
    'help',
    'html',
    'css',
    'scss',
    'svelte',
    'jsdoc',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  playground = {
    enable = false,
  },
})
