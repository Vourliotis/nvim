" Detect OS and install vim-plug
if empty(glob(g:nvim_home.'/autoload/plug.vim'))
  if has("unix")
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  elseif has("win32")
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
      ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim/autoload/plug.vim" -Force
  endif
endif

call plug#begin(g:nvim_home.'/autoload/plugged')
  " Navigate line with 'f'
  Plug 'unblevable/quick-scope'
  " Jump anywhere in the document with 's'
  Plug 'phaazon/hop.nvim'

  if !exists('g:vscode')
    Plug 'preservim/nerdcommenter'
    Plug 'https://gitlab.com/__tpb/monokai-pro.nvim'
  endif
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
