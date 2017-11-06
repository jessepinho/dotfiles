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

# Install packages for home computer if HOME env variable is set
if [ -z ${HOME+x} ]; then
  brew install $(cat brew/brew-packages.home.txt)
  brew cask install $(cat brew/brew-cask-packages.home.txt)
fi

# Install packages for work computer if WORK env variable is set
if ! [ -z ${WORK+x} ]; then
  brew cask install $(cat brew/brew-cask-packages.work.txt)
fi

echo "Install these manually: Amphetamine"
