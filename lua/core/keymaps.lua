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

  keymap('n', '<leader>n', '<cmd> noh <CR>', opts)
  -- nvim-tree
  keymap('n', '<leader>e', '<cmd> NvimTreeToggle <CR>', opts)

  -- Resize with arrows
  keymap('n', '<C-Up>', ':resize +2<CR>', opts)
  keymap('n', '<C-Down>', ':resize -2<CR>', opts)
  keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
  keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

  -- Better window navigation
  keymap('n', '<C-h>', '<C-w>h', opts)
  keymap('n', '<C-j>', '<C-w>j', opts)
  keymap('n', '<C-k>', '<C-w>k', opts)
  keymap('n', '<C-l>', '<C-w>l', opts)

  -- Telescope
  -- Show key bindings list
  keymap('n', '<Leader>?', ':Telescope keymaps<CR>', opts)
  -- Search pattern
  keymap('n', '<leader>fw', ':Telescope live_grep<CR>', opts)
  -- Find files by name
  keymap('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
  keymap('n', '<Leader>fa', ':Telescope find_files follow=true no_ignore=true hidden=true<CR>', opts)
  -- Search in files history
  keymap('n', '<Leader>fo', ':Telescope oldfiles<CR>', opts)
  -- Search in active buffers list
  keymap('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
  -- git
  keymap('n', '<Leader>gc', ':Telescope git_commits<CR>', opts)
  keymap('n', '<Leader>gb', ':Telescope git_bcommits<CR>', opts)
  keymap('n', '<Leader>gs', ':Telescope git_status<CR>', opts)

  -- Bufferline
  -- New buffer
  keymap('n', '<S-b>', '<cmd>enew<CR>', opts)
  -- Cycle trhough buffers
  keymap('n', '<TAB>', '<cmd>BufferLineCycleNext<CR>', opts)
  keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', opts)
  -- Reorder buffers
  keymap('n', '<S-h>', '<cmd>BufferLineMovePrev<CR>', opts)
  keymap('n', '<S-l>', '<cmd>BufferLineMoveNext<CR>', opts)
  -- Close buffer and hide terminal
  keymap('n', '<C-w>', ':lua require("core.utils").close_buffer()<CR>', opts)

  -- Git
  keymap('n', '<leader>gd', '<cmd>VGit buffer_diff_preview<CR>', opts)
  keymap('n', '<leader>gh', '<cmd>VGit buffer_history_preview<CR>', opts)
  keymap('n', '<C-]>', '<cmd>VGit hunk_down<CR>', opts)
  keymap('n', '<C-[>', '<cmd>VGit hunk_up<CR>', opts)

  -- LSP
  keymap('n', "<leader>'f", ':lua vim.lsp.buf.formatting()<CR>', opts)

  -- Comments
  keymap('n', '<C-_>', 'gcc', { silent = true })
  keymap('v', '<C-_>', 'gcgv', { silent = true })
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
