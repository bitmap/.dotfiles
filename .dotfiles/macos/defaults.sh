#!/bin/zsh

# Close any open System Preferences panes, to prevent them from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# System: expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# System: expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# System: save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# System: disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# System: disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# System: disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# System: disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# System: disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# System: disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# System: Turn off predictive text pop-up
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -int 0

# System: set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# System: require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# System: disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# System: prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Finder: set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: set home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Finder: When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Finder: disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Finder: disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Finder: Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: Adjust toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Dock: enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Dock: don’t show recent applications
defaults write com.apple.dock show-recents -bool false

# Dock: Don’t animate opening applications
defaults write com.apple.dock launchanim -bool false

# Dock: automatically hide and show
defaults write com.apple.dock autohide -bool true

# Dock: remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# Dock: remove the animation when hiding/showing
defaults write com.apple.dock autohide-time-modifier -float 0

# Dock: make icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Dock: Delete all shortcuts in the Dock
defaults write com.apple.dock persistent-apps -array

# Mission Control: speed up animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Mission Control: don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Terminal: disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Terminal: only use UTF-8
defaults write com.apple.terminal StringEncodings -array 4

# TextEdit: use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0

# TextEdit: open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
