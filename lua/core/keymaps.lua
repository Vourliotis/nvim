local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Map Greek characters in Normal Mode
vim.opt.langmap = 'ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz'

-- Modes
--   normal_mode = 'n'
--   insrt_mode = 'i'
--   visual_block_mode = 'x'
--   term_mode = 't'
--   command_mode = 'c'

-- TUI/GUI NeoVim only settings
if not vim.g.vscode then
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  keymap('n', '<leader>e', ':Lex 30<cr>', opts)

  -- Resize with arrows
  keymap('n', '<C-Up>', ':resize +2<CR>', opts)
  keymap('n', '<C-Down>', ':resize -2<CR>', opts)
  keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
  keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

  -- Navigate buffers
  keymap('n', '<S-l>', ':bnext<CR>', opts)
  keymap('n', '<S-h>', ':bprevious<CR>', opts)

  -- Better window navigation
  keymap('n', '<C-h>', '<C-w>h', opts)
  keymap('n', '<C-j>', '<C-w>j', opts)
  keymap('n', '<C-k>', '<C-w>k', opts)
  keymap('n', '<C-l>', '<C-w>l', opts)
end

-- Normal --
keymap('n', 's', '<cmd>HopChar2<CR>', opts)

-- Insert --
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'ξκ', '<ESC>', opts)

-- Visual --
keymap('v', 's', '<cmd>HopChar2<CR>', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<CR>gv-gv", opts)
keymap('x', 'K', ":move '<-2<CR>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
