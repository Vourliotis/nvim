<h1 align="center">Hybrid NeoVim/VSCode Config</h1>

<div align="center">
  This project hosts a versatile and easy-to-use NeoVim config
  written in Lua, designed to deliver a comfortable and consistent
  developer experience in both NeoVim and VSCode.
</div>

## 💡 Rationale

Transitioning from a GUI-based text editor such as VSCode to a highly
customizable terminal-based editor like NeoVim can feel like a daunting task.
This config aims to smooth out this learning curve, allowing developers
to switch between these two at their own pace and comfort level.
The keybinds were deliberatly chosen to offer a consistent developer
experience across both editors.

## 📦 Dependencies

Before you proceed, make sure you have the following installed:

- [NeoVim 0.9+](https://github.com/neovim/neovim)
- [make](https://www.gnu.org/software/make/)
- [fzf](https://github.com/junegunn/fzf) - a general-purpose command-line fuzzy finder
- [ripgrep](https://github.com/BurntSushi/ripgrep) - a line-oriented search tool
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - for icon and glyph support
- [vscode-neovim](https://github.com/vscode-neovim/vscode-neovim/) - a NeoVim integration extension for VSCode
- A system clipboard integration tool (`:help clipboard-tool`)
- C++ Compiler
  - **For Linux**: G++
  - **For Windows**: MinGW

## ⚙️ Installation

To use this config, follow these steps:

1. Clone this repository into your nvim config folder, which is typically:
    - **Linux/Mac**: `$HOME/.config/`
    - **Windows**: `$ENV:LocalAppData`
2. Specify the path to your `init.lua` in the `vscode-neovim` extension settings in VSCode.
3. Open NeoVim, which will automatically install the plugins on the first start.

> **Note**: VSCode config files can be found in the `.vscode/` directory.
