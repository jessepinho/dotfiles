#!/usr/bin/env bash

# Install Homebrew if it doesn't yet exist.
if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

# Normal packages
brew install $(cat brew/brew-packages.txt)

# Special cases
brew install vim --with-lua --force

# Casks
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
brew cask install $(cat brew/brew-cask-packages.txt)
