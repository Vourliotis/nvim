" Detect OS and install vim-plug
if has("unix")
  " Set nvim home directory depenging on operating system
  let g:nvim_home = get(g:, 'nvim_home', expand('~/.config/nvim'))

  " Auto-install vim-plug on Linux
  if empty(glob(g:nvim_home.'/autoload/plug.vim'))
    silent sh -c 'curl -fLo "$HOME"/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
elseif has("win32")
  " Set nvim home directory depenging on operating system
  let g:nvim_home = get(g:, 'nvim_home', expand('~/AppData/Local/nvim'))

  " Auto-install vim-plug on Windows
  if empty(glob(g:nvim_home.'/autoload/plug.vim'))
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
      ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim/autoload/plug.vim" -Force
  endif
endif

call plug#begin(g:nvim_home.'/autoload/plugged')
  " Text Navigation with 'f'
  Plug 'unblevable/quick-scope'
  " Highlights yanked text
  Plug 'machakann/vim-highlightedyank'
  if exists('g:vscode')
    " Easy motion for VSCode
    Plug 'ChristianChiarulli/vscode-easymotion'
    " Easy motion for VSCode from the nvim extension author
    " Plug 'asvetliakov/vim-easymotion'
  else
    " Adds 's' motion key
    Plug 'easymotion/vim-easymotion'
  endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
