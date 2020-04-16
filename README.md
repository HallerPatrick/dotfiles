# 📄Dotfiles

<p align="center">
  <img src="./assets/banner.png"/>
</p>

# Usage / Installation

## Deploy configs

```bash
git clone https://www.github.com/HallerPatrick/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

## Powerlevel10k

[Powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh) is a zsh theme, that is easily set up.

Run:
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
source .dotfiles/zshrc # Or your .zshrc config location
```

This will clone all dotfiles and create symlinks to their according place, powered by
[dotbot](https://github.com/anishathalye/dotbot)

# Things I Use

A curated list of all possible apps and features I use:

### Command Line

* [Zsh](https://www.zsh.org/), shell (now MacOS default)
* [iTerm2](https://iterm2.com/), goto command line for MacOS
* [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh), Zsh configurations
* [Powerlevel10k](https://github.com/romkatv/powerlevel10k), Zsh Theme
* [Apple Font SF Mono](https://developer.apple.com/fonts/), Font used for iTerm2

### Utilities

* [Alfred](https://www.alfredapp.com/), better Spotlight
* [Magnet](https://magnet.crowdcafe.com/) Window Manager
* [BetterTouchTool](https://folivora.ai/) Customization for MacOS (mainly used for Mac TouchBar)
* [aerc](https://aerc-mail.org/), Command Line Email Client
* [neovide](https://github.com/Kethku/neovide), Neovim Client used on Windows Systems
* [LiteIcon](https://freemacsoft.net/liteicon/), Custome System Icons
  * [Terminal Icon](https://github.com/dhanishgajjar/terminal-icons)
* [Zathura](https://pwmt.org/projects/zathura/), PDF Viewer
* [VSCode](https://code.visualstudio.com), a non-vim Editor
  * [Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop), Latex Plugin with Hot Reload
  * [Vim Emulator](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim), kinda like VIM but not the same

# Homebrew

 Install all brew packages

```bash
bash brew.sh
```

# Screenshots

## iTerm2 / Neovim
![](./assets/nvim.png)
