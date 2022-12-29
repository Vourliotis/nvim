local bind = vim.keymap.set
local remap = { remap = true }

vim.opt.langmap = 'ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,'
  .. 'ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,'
  .. 'σs,τt,θu,ωv,ςw,χx,υy,ζz'

-- Unbind 'K'
bind('n', 'K', '<NOP>')

-- Exit insert mode
bind('i', 'jk', '<ESC>')
bind('i', 'ξκ', '<ESC>')

-- Stay in indent mode after indenting text
bind('v', '<', '<gv')
bind('v', '>', '>gv')

-- Move text up and down
bind('x', 'J', ":move '>+1<CR>gv=gv")
bind('x', 'K', ":move '<-2<CR>gv=gv")

-- Hop
bind('n', 's', '<CMD>HopChar2<CR>')
bind('v', 's', '<CMD>HopChar2<CR>')

-- TUI/GUI NeoVim only settings
if not vim.g.vscode then
  vim.g.mapleader = ' '

  -- Clear highlights and prints
  bind('n', '<leader>n', '<CMD>noh<CR><cmd>echo ""<CR>')

  -- nvim-tree
  bind('n', '<leader>e', '<CMD>NvimTreeToggle<CR>')

  -- Resize with arrows
  bind('n', '<C-Up>', '<CMD>resize +2<CR>')
  bind('n', '<C-Down>', '<CMD>resize -2<CR>')
  bind('n', '<C-Left>', '<CMD>vertical resize -2<CR>')
  bind('n', '<C-Right>', '<CMD>vertical resize +2<CR>')

  -- Better window navigation
  bind('n', '<C-h>', '<C-w>h')
  bind('n', '<C-j>', '<C-w>j')
  bind('n', '<C-k>', '<C-w>k')
  bind('n', '<C-l>', '<C-w>l')

  -- Telescope
  -- Show key bindings list
  bind('n', '<Leader>?', '<CMD>Telescope keymaps<CR>')
  -- Search pattern
  bind('n', '<leader>fw', '<CMD>Telescope live_grep_args<CR>')
  -- Find files by name
  bind('n', '<Leader>ff', '<CMD>Telescope find_files<CR>')
  bind('n', '<Leader>fa', '<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>')
  -- Search in active buffers list
  bind('n', '<Leader>fb', '<CMD>Telescope buffers<CR>')
  -- Resume last search
  bind('n', '<Leader>fr', '<CMD>Telescope resume<CR>')
  -- Cached pickers
  bind('n', '<Leader>fp', '<CMD>Telescope pickers<CR>')
  -- Help tags
  bind('n', '<Leader>fh', '<CMD>Telescope help_tags<CR>')

  -- Sessions
  bind('n', '<Leader>sl', '<CMD>Telescope persisted<CR>')
  bind('n', '<Leader>ss', '<CMD>SessionSave<CR>')

  -- Bufferline
  bind('n', '<S-Tab>', '<CMD>BufferPrevious<CR>')
  bind('n', '<Tab>', '<CMD>BufferNext<CR>')
  -- Re-order to previous/next
  bind('n', '<S-h>', '<CMD>BufferMovePrevious<CR>')
  bind('n', '<S-l>', '<CMD>BufferMoveNext<CR>')
  -- Pin/unpin buffer
  bind('n', '<C-p>', '<CMD>BufferPin<CR>')
  -- Close buffer
  bind('n', '<C-w>', '<CMD>BufferClose<CR>')
  bind('n', '<C-s>', '<CMD>BufferPick<CR>')

  -- Git
  bind('n', '<leader>gd', '<CMD>VGit buffer_diff_preview<CR>')
  bind('n', '<leader>gh', '<CMD>VGit buffer_history_preview<CR>')
  bind('n', '<C-]>', '<CMD>VGit hunk_down<CR>')
  bind('n', '<C-[>', '<CMD>VGit hunk_up<CR>')
  bind('n', '<leader>gb', '<CMD>VGit toggle_live_blame<CR>')

  -- LSP
  bind('n', '<leader>k', vim.diagnostic.open_float)

  -- Comments
  bind('n', '<C-_>', 'gcc', remap)
  bind('v', '<C-_>', 'gcgv', remap)

  -- Harpoon
  bind('n', '<leader>hm', '<CMD>lua require("harpoon.mark").add_file()<CR>')
  bind('n', '<leader>hl', '<CMD>Telescope harpoon marks<CR>')
end
