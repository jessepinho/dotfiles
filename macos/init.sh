#!/usr/bin/env bash

# Inspiration: https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Enable tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# When zoomed in, the screen image moves continuously with pointer
defaults write ~/Library/Preferences/com.apple.universalaccess.plist closeViewPanningMode -int 0

# Minimize windows using scale effect
defaults write com.apple.dock mineffect scale

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Start SizeUp app at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# Make key repeat faster
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Require password immediately after sleep or screensaver begins
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show the percentage in the battery menu item
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
