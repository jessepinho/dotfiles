#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install $(cat brew-packages.txt)
brew cask install $(cat brew-cask-packages.txt)
