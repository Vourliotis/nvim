" auto-install vim-plug
if has("unix")
  if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
    silent sh -c 'curl -fLo "$HOME"/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
  call plug#begin('$HOME/.config/nvim/autoload/plugged')
    " Text Navigation
    Plug 'unblevable/quick-scope'
  call plug#end()
elseif has("win32")
  if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
      ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim/autoload/plug.vim" -Force
  endif
  call plug#begin('$HOME/AppData/Local/nvim/autoload/plugged')
    " Text Navigation
    Plug 'unblevable/quick-scope'
    if exists('g:vscode')
      " Easy motion for VSCode
      " Plug 'asvetliakov/vim-easymotion'
      Plug 'ChristianChiarulli/vscode-easymotion'
      Plug 'machakann/vim-highlightedyank'
    endif
  call plug#end()
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
