#!/usr/bin/env bash

# Inspiration: https://mths.be/macos

# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # Calendar
# ## Preferences
# ### General
# Show: 24 hours at a time
defaults write com.apple.iCal "number of hours displayed" 24

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
# View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# # iTerm2
# Use Cmd + Shift + ~ keyboard shortcut for showing/hiding iTerm
defaults write com.googlecode.iterm2 Hotkey -bool true
defaults write com.googlecode.iterm2 HotkeyChar -int 126
defaults write com.googlecode.iterm2 HotkeyCode -int 50
defaults write com.googlecode.iterm2 HotkeyModifiers -int 1179914

# # Misc
# Don't auto-connect with Bluetooth devices
# Found at http://apple.stackexchange.com/a/226169/66224
sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist DontPageAudioDevices 1
# Show all files (including dotfiles)
defaults write com.apple.finder AppleShowAllFiles YES
# Show the percentage in the battery menu item
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Customize the icons in the Touch Bar
defaults write com.apple.controlstrip MiniCustomized '( "com.apple.system.screen-lock", "com.apple.system.volume", "com.apple.system.mute", "com.apple.system.dashboard" )'
defaults write com.apple.controlstrip FullCustomized '( "com.apple.system.group.brightness", "com.apple.system.mission-control", "com.apple.system.dashboard", "com.apple.system.group.keyboard-brightness", "com.apple.system.group.media", "com.apple.system.group.volume", "com.apple.system.screen-lock" )'
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
defaults write com.apple.dock autohide-delay -float 2
# Disable the dashboard
# https://www.howtogeek.com/tips/how-to-disable-the-useless-dashboard-on-mac-os-x/
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
# Disable the character accent menu
defaults write -g ApplePressAndHoldEnabled -bool false

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
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# #### Zoom style > Options...
# When zoomed in, the screen image moves: Continuously with pointer
defaults write ~/Library/Preferences/com.apple.universalaccess.plist closeViewPanningMode -int 0
# ## Date & Time
# ### Clock
# Date options: Show the day of the week & Show date ("Sun Jan 1 13:00")
defaults write com.apple.menuextra.clock DateFormat "EEE MMM d H:mm"
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
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
# Temperature: Celsius
defaults write ~/Library/Preferences/.GlobalPreferences AppleTemperatureUnit Celsius
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
