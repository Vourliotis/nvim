" Basic Key Mappings
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" g Leader key
let mapleader=" "

" let localleader=" "
nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Simulate same TAB behavior in VSCode
if exists('g:vscode')
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
endif

" Better nav for 	
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Map jk to esc
:imap jk <Esc>
:imap kj <Esc>