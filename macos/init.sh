#!/usr/bin/env bash

# Inspiration: https://mths.be/macos

# # Evernote
# ## Preferences
# ### General
# Open Evernote when I log into my computer - DISABLE
defaults write com.evernote.Evernote runAtLogin -bool false
# Keep Evernote Helper running in the background when I quit Evernote
defaults write com.evernote.Evernote runHelperWithoutMainApp -bool false
# Start the Evernote Helper when I log into my computer - DISABLE
defaults write com.evernote.Evernote runHelperAtLogin -bool false

# # iTerm2
# Use Cmd + Shift + ~ keyboard shortcut for showing/hiding iTerm.
defaults write com.googlecode.iterm2 Hotkey -bool true
defaults write com.googlecode.iterm2 HotkeyChar -int 126
defaults write com.googlecode.iterm2 HotkeyCode -int 50
defaults write com.googlecode.iterm2 HotkeyModifiers -int 1179914

# # Misc
# Show the percentage in the battery menu item
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Customize the icons in the Touch Bar
defaults write com.apple.controlstrip MiniCustomized '( "com.apple.system.screen-lock", "com.apple.system.volume", "com.apple.system.mute", "com.apple.system.dashboard" )'
defaults write com.apple.controlstrip FullCustomized '( "com.apple.system.group.brightness", "com.apple.system.mission-control", "com.apple.system.dashboard", "com.apple.system.group.keyboard-brightness", "com.apple.system.group.media", "com.apple.system.group.volume", "com.apple.system.screen-lock" )'

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
# ## Language & Region
# Time format: 24-Hour Time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
# ## Security & Privacy
# ### General
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPasswordDelay -int 0
# ## Trackpad
# ### Point & Click
# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
