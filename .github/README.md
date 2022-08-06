<h1 align="center">Hybrid NeoVim/VSCode Configuration</h1>

This is a NeoVim configuration written in Lua, aiming to provide an amazing
developer experience both when used inside VSCode and when used in the terminal.

## Why support both terminal NeoVim and VSCode NeoVim?
A lot of people find it hard to transition from a GUI editor like VSCode to NeoVim.
This configuration hopes to make this a lot easier by allowing people to switch
between these two and experiment at their own pace.

## Dependencies
- [NeoVim 0.7+](https://github.com/neovim/neovim)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim/) extension
  for VSCode
- A clipboard tool for the intergration with the system clipboard (`:help clipboard-tool`)
- Optional Dependencies:
  - [ripgrep](https://github.com/BurntSushi/ripgrep)
  - [fzf](https://github.com/junegunn/fzf)

## Installation
- Git clone the repo inside your nvim configuration folder which is usually in:
  - ***Linux/Mac***
    ```
    $HOME/.config/
    ```
  - ***Windows***
    ```
    $ENV:LocalAppData
    ```
- Open NeoVim and run `:PackerSync` to install the packages
- Set your init.lua path in the `vscode-neovim` extension settings

> Note: Example config files for the above can be found in `/lua/vscode/config/`
