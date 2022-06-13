<h1 align="center">Hybrid NeoVim Configuration</h1>

This is a NeoVim configuration written in Lua, aiming to provide an amazing developer experience
both when used inside VSCode and when used in the terminal.

## Why support both terminal NeoVim and VSCode NeoVim?
A lot of people find it hard to transition from a GUI editor like VSCode to NeoVim. This configuration
hopes to make this a lot easier by allowing people to switch between these too and experiment at their
own pace.

## Installation
- Install the [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim/) extension
- Install Neovim 0.5.0 or greater
  - Set the neovim path in the extension settings
- Git clone the repo inside your nvim configuration folder which is usually in:
  - **Linux:** `C:\Users\%USERNAME%\AppData\Local\`
  - **Windows:** `$HOME/.config/`
- Change your init.lua path in your VSCode settings.json

Example config files for the above can be found in `/lua/vscode/config/`
