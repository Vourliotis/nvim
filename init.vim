"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
if has("unix")
  source $HOME/.config/nvim/vim-plug/plugins.vim
  source $HOME/.config/nvim/general/settings.vim
  source $HOME/.config/nvim/general/functions.vim
  source $HOME/.config/nvim/keybindings/mappings.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim
  source $HOME/.config/nvim/plug-config/easymotion.vim
  source $HOME/.config/nvim/plug-config/highlightyank.vim
  if exists('g:vscode')
    " VSCode extension
    source $HOME/.config/nvim/vscode/settings.vim
  endif
elseif has("win32")
  source $HOME/AppData/Local/nvim/vim-plug/plugins.vim
  source $HOME/AppData/Local/nvim/general/settings.vim
  source $HOME/AppData/Local/nvim/general/functions.vim
  source $HOME/AppData/Local/nvim/keybindings/mappings.vim
  source $HOME/AppData/Local/nvim/plug-config/quickscope.vim
  source $HOME/AppData/Local/nvim/plug-config/easymotion.vim
  source $HOME/AppData/Local/nvim/plug-config/highlightyank.vim
  if exists('g:vscode')
    " VSCode extension
    source $HOME/AppData/Local/nvim/vscode/settings.vim
  endif
endif
