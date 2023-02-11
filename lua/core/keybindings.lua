local bind = vim.keymap.set

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
bind('x', 'J', ":move '>+1<CR>gv")
bind('x', 'K', ":move '<-2<CR>gv")

-- TUI/GUI NeoVim only settings
if not vim.g.vscode then
  vim.g.mapleader = ' '

  -- Clear highlights and prints
  bind('n', '<LEADER>n', '<CMD>noh<CR><cmd>echo ""<CR>')

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

  -- Delete selection into void register before pasting
  bind('x', '<LEADER>p', '"_dP')

  -- LSP
  bind('n', '<LEADER>k', vim.diagnostic.open_float)
end
