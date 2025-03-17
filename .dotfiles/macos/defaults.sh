#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding settings
osascript -e 'tell application "System Preferences" to quit'

# [System] Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# [System] Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# [System] Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# [System] Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# [System] Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# [System] Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# [System] Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# [System] Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# [System] Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# [System] Turn off predictive text pop-up
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -int 0

# [System] Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# [System] Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# [System] Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# [System] Tune trackpad haptic feedback to be more silent
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# [System] Disable mouse shake to locate
defaults write com.apple.HITSupport mouseShakeToLocate -bool false

# [System] Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# [System] Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# [System] Save screenshots to Screenshots folder
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# [System] Save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"

# [System] Disable screenshots thumbnail
defaults write com.apple.screencapture show-thumbnail -bool false

# [System] Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# [System] Disable Resume system-wide
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# [System] Disable hot corners
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

# [Finder] Disable animations
defaults write com.apple.finder DisableAllAnimations -bool true

# [Finder] Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# [Finder] Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# [Finder] Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# [Finder] Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# [Finder] Set $HOME as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# [Finder] When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# [Finder] Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# [Finder] Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# [Finder] Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# [Finder] Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# [Finder] Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# [Finder] Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# [Finder] Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# [Finder] Adjust toolbar title rollover delay
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# [Finder] Always show icon in title bar
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

# [Finder] Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# [Finder] Show icons for external hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# [Finder] Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# [Finder] Set the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 40" ~/Library/Preferences/com.apple.finder.plist

# [Finder] Show the ~/Library folder
chflags nohidden ~/Library

# [Dock] Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 40

# [Dock] Prevent the Dock from changing size
defaults write com.apple.dock size-immutable -bool true

# [Dock] Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# [Dock] Don’t show recent applications
defaults write com.apple.dock show-recents -bool false

# [Dock] Don’t animate opening applications
defaults write com.apple.dock launchanim -bool false

# [Dock] Automatically hide and show
defaults write com.apple.dock autohide -bool true

# [Dock] Remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# [Dock] Remove the animation when hiding/showing
defaults write com.apple.dock autohide-time-modifier -float 0

# [Dock] Make icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# [Dock] Minimize effect
defaults write com.apple.dock mineffect -string "scale"

# [Dock] Delete all shortcuts in the Dock
defaults write com.apple.dock persistent-apps -array

# [Mission Control] Speed up animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# [Mission Control] Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# [Terminal] Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# [Terminal] Only use UTF-8
defaults write com.apple.terminal StringEncodings -array 4

# [TextEdit] Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0

# [TextEdit] Open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# [UI] Set color scheme
defaults write NSGlobalDomain AppleAccentColor -int -1
defaults write NSGlobalDomain AppleAquaColorVariant -int 6;
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.937255 0.690196 Yellow";
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# [UI] Enable the 'reduce transparency' option
defaults write com.apple.universalaccess reduceTransparency -bool true

# [UI] Set wallpaper
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/Solid Colors/Stone.png"'

# [Safari] Show full URL
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# [Safari] Enable the dev tools
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# [Safari] Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# [Mail] Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# [Activity Monitor] Show the main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# [Activity Monitor] Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# [Activity Monitor] More frequent updates
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# [App Store] Disable in-app rating requests from apps downloaded from the App Store.
defaults write com.apple.appstore InAppReviewEnabled -int 0

# [Siri] Disable Apple Intelligence
defaults write com.apple.CloudSubscriptionFeatures.optIn 545129924 -bool false

# [Siri] Hide Siri
defaults write com.apple.siri StatusMenuVisible -int 0
