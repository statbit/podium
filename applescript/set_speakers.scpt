on run speaker_list
  tell application "Airfoil"
    repeat with s in (get every speaker)
      if speaker_list contains (name of s)
        connect to s
      end if
    end repeat
  end tell
end run
