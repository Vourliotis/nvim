-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above, below, left and right of the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Allow cursor movement keys to wrap around lines and between lines
-- Enhances navigation with arrow keys, h, l, backspace, and space
vim.opt.whichwrap:append('<,>,[,],h,l')

-- Treat hyphenated words as a single word for editing and navigation
vim.opt.iskeyword:append({ '-' })

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Set number of spaces for indentations and tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Do not insert any text for a match until the user selects a match from the menu
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }

-- Disable line wrap
vim.opt.wrap = false

-- Enable true color support
vim.opt.termguicolors = true

-- Disable foldcolumn
vim.opt.foldcolumn = '0'

-- Start with all folds open
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Enable folding
vim.opt.foldenable = true

-- Use 'g' by default with :s/foo/bar
vim.opt.gdefault = true

-- Ignore swap file messages
vim.opt.shortmess:append('A')

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- Clear highlighting for ColorColumn
vim.cmd('highlight clear ColorColumn')

-- Remove 'c', 'r', 'o' from 'formatoptions' for all file types
-- Prevents automatic comment formatting in new lines
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

local general_group = vim.api.nvim_create_augroup('general', {})

vim.api.nvim_create_autocmd('FocusGained', {
  desc = 'Reload files from disk when we focus neovim',
  pattern = '*',
  command = 'silent! checktime',
  group = general_group,
})

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Every time we enter an unmodified buffer, check if it changed on disk',
  pattern = '*',
  command = "if &buftype == '' && !&modified | exec 'checktime ' . expand('<abuf>') | endif",
  group = general_group,
})

if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
  vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
