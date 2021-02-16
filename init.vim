"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
source $HOME/AppData/Local/nvim/vim-plug/plugins.vim
source $HOME/AppData/Local/nvim/general/settings.vim
source $HOME/AppData/Local/nvim/general/functions.vim
source $HOME/AppData/Local/nvim/keybindings/mappings.vim

if exists('g:vscode')
  " VS Code extension
  source $HOME/AppData/Local/nvim/vscode/settings.vim
  source $HOME/AppData/Local/nvim/plug-config/easymotion.vim
  source $HOME/AppData/Local/nvim/plug-config/highlightyank.vim
endif
source $HOME/AppData/Local/nvim/plug-config/quickscope.vim

" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")