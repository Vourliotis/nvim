"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/

" Detect OS
if has("unix")
  let g:nvim_home = get(g:, 'nvim_home', expand('~/.config/nvim'))
elseif has("win32")
  let g:nvim_home = get(g:, 'nvim_home', expand('~/AppData/Local/nvim'))
endif

" General settings
lua require "user.core.options"
exec 'source' g:nvim_home.'/vim-plug/plugins.vim'
exec 'source' g:nvim_home.'/general/functions.vim'
exec 'source' g:nvim_home.'/keybindings/mappings.vim'
exec 'source' g:nvim_home.'/plug-config/quickscope.vim'
exec 'source' g:nvim_home.'/plug-config/hop.vim'
exec 'source' g:nvim_home.'/plug-config/highlightyank.vim'

" VSCode settings
if exists('g:vscode')
  exec 'source' g:nvim_home.'/vscode/settings.vim'
else
  exec 'source' g:nvim_home.'/plug-config/nerdcommenter.vim'
endif
