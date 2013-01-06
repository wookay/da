-- art.scpt
-- wookay.noh at gmail.com

tell application "System Events"
  delay 1
  key down {command}
  keystroke "n"
  key up {command}
  delay 1

  keystroke return
  delay 1
  keystroke "tail -37 art.scpt > clon.scpt"
  keystroke return
  delay 1

  keystroke return
  delay 1

  keystroke "vi clon.scpt"
  delay 2
  keystroke return
  delay 1

  repeat 2 times
    set x to random number from 5 to 9
    keystroke x as text
    keystroke "j"
    set x to random number from 5 to 9
    keystroke x as text
    keystroke "l"
    delay 1
  end repeat

  keystroke "/"
  delay 1
  keystroke "-- fill"
  delay 1
  keystroke return
  delay 1
  keystroke "j"
  delay 1
  keystroke "10l"
  delay 1
  keystroke "a"
  delay 1
  keystroke "say "
  delay 1

  keystroke "code "
  delay 1
  keystroke "can "
  keystroke "be "
  keystroke "an "
  delay 1
  keystroke "art"
  delay 1

  key code 53
  delay 1

  keystroke "j"
  delay 1

  repeat 3 times
    set x to random number from 5 to 9
    keystroke x as text
    keystroke "j"
    set x to random number from 5 to 9
    keystroke x as text
    keystroke "l"
    delay 1
  end repeat

  keystroke ":wq"
  delay 2
  keystroke return
  delay 1

  keystroke return
  delay 1

  keystroke "osascript clon.scpt"
  delay 1
  keystroke return
  delay 1

  delay 10
end tell

exit


-- clon.scpt
-- http://wookay.com

tell application "System Events"
  delay 2
  key down {command}
  keystroke "`"
  key up {command}
  delay 1

  key down control
  delay 1
  keystroke "c"
  key up control
  delay 1

  keystroke "exit"
  delay 2
  keystroke return
  delay 1

  key down {command}
  keystroke "`"
  key up {command}
  delay 1

  -- fill
  keystroke ""

  keystroke return
  delay 1

  keystroke "osascript art.scpt"
  delay 2
  keystroke return
  delay 1
end tell
