set the_speaker_list to ""
tell application "Airfoil"
  set speaker_list to get every speaker
  repeat with sp in speaker_list
    set the_speaker_list to the_speaker_list & name of sp & ","
  end repeat
end tell
return text of the_speaker_list
