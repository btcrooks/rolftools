# Rolf Tools
# Authors: Brandon Crooks, Lorenzo Azore 
# Version: 1.1

# Close system prefrences
if application "System Preferences" is running then
  tell application "System Preferences" to quit
end if

# Change Desktop Background(s)
tell application "System Events"
  set theDesktops to a reference to every desktop
  repeat with x from 1 to (count theDesktops)
    set picture of item x of the theDesktops to "/Library/Desktop Pictures/Solid Colors/Solid Gray Dark.png"
  end repeat
end tell

#Set Finder & Dock preferences
tell application "System Events"
  --Set Finder prefrences
  set finderPrefsFile to property list file "~/Library/Preferences/com.apple.Finder.plist"
  tell finderPrefsFile
    tell property list item "DesktopViewSettings"
      tell property list item "IconViewSettings"
        set value of property list item "gridSpacing" to "100"
        set value of property list item "
      end tell
    end tell
  end tell
  --Set Dock preferences
  tell dock preferences
    set properties to {dock size:0.1}
  end tell
end tell
tell application "Finder"
  activate
  set iconViewOption to desktop's window's icon view options
  tell iconViewOption
    set arrangment to not arranged
    set icon size to 24
    set shows item info to false
  end tell
  quit
end tell
# Restart Finder, Dock and System UI Server
delay 1
tell application "Finder" to activate
do shell script "killall Dock & killall SystemUIServer"
