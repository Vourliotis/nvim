:set ma
set iskeyword+=-                      	" Treat dash separated words as a word text object
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enable syntax highlighing
set hidden                              " Keep multiple buffers open
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " Display with this encoding
set pumheight=10                        " Make popup menu smaller
set fileencoding=utf-8                  " Write with this encoding
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " Add more space for displaying messages
set mouse=a                             " Enable the mouse
set splitbelow                          " Put the horizontal splits below
set splitright                          " Put the vertical split to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " Show `` in Markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Make tabbing smarter. It will realize you have 2 vs 4 spaces
set expandtab                           " Convert tabs to spaces
set smartindent                         " Make indenting smart
set autoindent                          " Make auto identation better
set laststatus=2                        " Always display the status line
set number                              " Show line numbers
set background=dark                     " Tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " Disable Vim Mode messages
set nobackup                            " Recommended by coc
set nowritebackup                       " Recommended by coc
set shortmess+=c                        " Stop giving messages to ins-completion-menu
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Add faster completion
set timeoutlen=100                      " Make timeout shorter. Default is 1000ms
set clipboard=unnamedplus               " Allow copy pasting between NeoVim and everything else
set incsearch                           " Enable incremental search
set ignorecase                          " Set search to case-insensitive
set smartcase                           " Enable smart search
" set cursorline                        " Enable highlighting of the current line

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
