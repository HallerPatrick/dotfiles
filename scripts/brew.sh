#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Some core tools
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"


brew install autojump
brew install bat
brew install entr
brew install exa
brew install fzf
brew install git
brew install gotop
brew install htop
brew install lazygit
brew install neofetch
brew install neovim
brew install node
brew install ripgrep
