local present, treesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
  return
end

local options = {
  ensure_installed = {
    'ruby',
    'javascript',
    'lua',
    'vim',
    'html',
    'css',
    'scss',
    'json',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

treesitter.setup(options)
