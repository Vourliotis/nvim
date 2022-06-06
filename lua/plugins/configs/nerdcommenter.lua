-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { silent = true }

keymap('n', '<C-_>', '<Plug>NERDCommenterToggle', opts)
keymap('v', '<C-_>', '<Plug>NERDCommenterToggle<CR>gv', opts)

-- Add a space after the comment
vim.cmd [[ let NERDSpaceDelims = 1 ]]