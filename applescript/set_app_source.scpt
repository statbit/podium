on run argv
  log argv
  set app_location to item 1 of argv
  tell application "Airfoil"
    set my_source to make new application source
    set application file of my_source to app_location
    set current audio source to my_source
  end tell
end run
