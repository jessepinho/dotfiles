#!/usr/bin/env bash

# Install Homebrew if it doesn't yet exist.
if ! command -v brew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

function installFromFile {
  while read line; do
    if ! brew ls --versions $line; then brew install $line; fi
  done < $1
}

function installCasksFromFile {
  while read line; do
    if ! brew cask ls --versions $line; then brew cask install $line; fi
  done < $1
}

# Normal packages
installFromFile brew/brew-packages.txt

# Special cases
if ! brew ls --versions vim; then brew install vim --with-lua --force; fi

# Casks
brew tap caskroom/cask
installCasksFromFile brew/brew-cask-packages.txt

# Install packages for home computer if IS_HOME env variable is set
if ! [ -z ${IS_HOME+x} ]; then
  installFromFile brew/brew-packages.home.txt
  installCasksFromFile brew/brew-cask-packages.home.txt
fi

# Install packages for work computer if IS_WORK env variable is set
if ! [ -z ${IS_WORK+x} ]; then
  installCasksFromFile brew/brew-cask-packages.work.txt
fi

echo "Install these manually: Amphetamine"
