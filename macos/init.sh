#!/usr/bin/env bash

# Inspiration: https://mths.be/macos

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # Calendar
# ## Preferences
# ### General
# Show: 24 hours at a time
defaults write com.apple.iCal "number of hours displayed" 24
# ### Advanced
# Turn on time zone support
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# # Evernote
# ## Preferences
# ### General
# Open Evernote when I log into my computer - DISABLE
defaults write com.evernote.Evernote runAtLogin -bool false
# Keep Evernote Helper running in the background when I quit Evernote
defaults write com.evernote.Evernote runHelperWithoutMainApp -bool false
# Start the Evernote Helper when I log into my computer - DISABLE
defaults write com.evernote.Evernote runHelperAtLogin -bool false

# # Finder
# Show full path in title bar
# See https://www.defaults-write.com/display-full-posix-path-in-os-x-finder-title-bar/
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# ## Preferences
# ### Advanced
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# ### General
# New Finder windows show: jessepinho (home directory)
# Other options:
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
# See https://github.com/joeyhoer/starter/blob/516f5c66dbc0a7d0c8a092d38c794edf45ca92cd/apps/finder.sh#L136-L144
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
# View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# # Misc
# Don't auto-connect with Bluetooth devices
# Found at http://apple.stackexchange.com/a/226169/66224
# sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist DontPageAudioDevices 1
# Show all files (including dotfiles)
defaults write com.apple.finder AppleShowAllFiles YES
# Show the percentage in the battery menu item
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Customize the icons in the menu bar
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu" \
	"/System/Library/CoreServices/Menu Extras/Displays.menu" \
	"/System/Library/CoreServices/Menu Extras/User.menu" \
	"/System/Library/CoreServices/Menu Extras/Volume.menu"
# Only show the dock after a 2-second delay (to make sure I mean it)
# defaults write com.apple.dock autohide-delay -float 2
# Disable the dashboard
# https://www.howtogeek.com/tips/how-to-disable-the-useless-dashboard-on-mac-os-x/
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
# Disable the character accent menu
defaults write -g ApplePressAndHoldEnabled -bool false

# # Safari
# ## Preferences
# ### Advanced
# Show Develop menu in menu bar
defaults write com.apple.safari IncludeDevelopMenu -bool true

# # SizeUp
# Start SizeUp at login
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

# # System Preferences
# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'
# ## Accessibility
# ### Mouse & Trackpad
# #### Trackpad Options...
# Enable dragging (three finger drag)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
# ### Zoom
# Use scroll gesture with modifer keys to zoom: ^ Control
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# #### Zoom style > Options...
# When zoomed in, the screen image moves: Continuously with pointer
# defaults write ~/Library/Preferences/com.apple.universalaccess.plist closeViewPanningMode -int 0
# ## Date & Time
# ### Clock
# Date options: Show the day of the week; Show date; and Display the time with seconds ("Sun Jan 1 13:00:00")
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d h:mm:ss a"
# ## Dock
# Minimize windows using: Scale effect
defaults write com.apple.dock mineffect scale
# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# ## Keyboard
# ### Keyboard
# Key Repeat
defaults write -g KeyRepeat -int 2
# Delay Until Repeat
defaults write -g InitialKeyRepeat -int 15
# ### Shortcuts
# Full Keyboard Access: All controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# ## Language & Region
# Time format: 24-Hour Time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool false
# Temperature: Celsius
# defaults write ~/Library/Preferences/.GlobalPreferences AppleTemperatureUnit Celsius
# ## Mouse
# Secondary click
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# ## Security & Privacy
# ### General
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPasswordDelay -int 0
# ## Trackpad
# ### Point & Click
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# ### More Gestures
# Swipe between full-screen apps: Swipe left or right with four fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
# App Exposé - ENABLE
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
# App Exposé/Mission Control: Swipe (up/down) with four fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

# # TextEdit
# ## Preferences
# ### New Document tab
# Format: Plain text
defaults write com.apple.TextEdit RichText -bool false
