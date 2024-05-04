local bind = vim.keymap.set

vim.g.mapleader = ' '

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

-- Clear highlights and prints
bind('n', '<LEADER>n', '<CMD>noh<CR><cmd>echo ""<CR>')

-- Copy path to clipboard
bind('n', '<LEADER>yf', '<CMD>lua vim.fn.setreg("+", vim.fn.expand("%:."))<CR>')
bind('n', '<LEADER>yl', '<CMD>lua vim.fn.setreg("+", vim.fn.expand("%:.") .. ":" .. vim.fn.line("."))<CR>')

-- TUI/GUI NeoVim only settings
if not vim.g.vscode then
  -- Resize with arrows
  bind('n', '<C-Up>', '<CMD>resize +2<CR>')
  bind('n', '<C-Down>', '<CMD>resize -2<CR>')
  bind('n', '<C-Left>', '<CMD>vertical resize -2<CR>')
  bind('n', '<C-Right>', '<CMD>vertical resize +2<CR>')

  -- Improve window navigation
  bind('n', '<C-h>', '<C-w>h')
  bind('n', '<C-j>', '<C-w>j')
  bind('n', '<C-k>', '<C-w>k')
  bind('n', '<C-l>', '<C-w>l')
  bind('t', '<ESC><ESC>', '<C-\\><C-n>')
  bind('t', '<C-h>', '<CMD>wincmd h<CR>')
  bind('t', '<C-j>', '<CMD>wincmd j<CR>')
  bind('t', '<C-k>', '<CMD>wincmd k<CR>')
  bind('t', '<C-l>', '<CMD>wincmd l<CR>')

  -- Tab navigation
  bind('n', '<LEADER>tt', '<CMD>$tabnew<CR>')
  bind('n', '<LEADER>tq', '<CMD>tabclose<CR>')
  bind('n', '<LEADER>tn', '<CMD>tabnext<CR>')
  bind('n', '<LEADER>tp', '<CMD>tabprev<CR>')

  -- Delete selection into void register before pasting
  bind('x', '<LEADER>p', '"_dP')

  -- LSP
  bind('n', '<LEADER>k', vim.diagnostic.open_float)
  bind('n', '[d', vim.diagnostic.goto_prev)
  bind('n', ']d', vim.diagnostic.goto_next)
end
