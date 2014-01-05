tell application "Airfoil"
  repeat with s in (get every speaker)
    disconnect from s
  end repeat
end
