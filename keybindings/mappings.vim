" Switch windows
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

nnoremap <Space> <Nop>
if !exists('g:vscode')
  " Map leader key to space
  let mapleader=" "
  let localleader=" "
else
  " Simulate Tab behaviour in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
endif


" Better identation
vnoremap < <gv
vnoremap > >gv

" Map jk, ξκ to esc
:imap jk <Esc>
:imap kj <Esc>
:imap ξκ <Esc>
:imap κξ <Esc>

" Map Greek characters in Normal Mode
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
