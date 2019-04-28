on run argv

  global live_version
  global save_required

  set live_version to "10"
  set save_required to 0 -- not save -> 0, save -> 1

  if (count of argv) = 1

    set live_version to (item 1 of argv)
  else if (count of argv) = 2
    set live_version to (item 1 of argv)
    set save_required to (item 2 of argv)
  end if

  set app_name to "Ableton Live " & live_version & " Suite"

  if application app_name is running
    tell application app_name
      activate
      tell application "System Events"
        if save_required as number = 1
          keystroke "q" using command down
          keystroke return
        else
          keystroke "q" using command down
          keystroke tab
          keystroke return
        end if
      end tell
    end tell
  else
    log app_name & " is not running"
  end if
end run

on replaceText(theText, serchStr, replaceStr)
	set tmp to AppleScript's text item delimiters
	set AppleScript's text item delimiters to serchStr
	set theList to every text item of theText
	set AppleScript's text item delimiters to replaceStr
	set theText to theList as string
	set AppleScript's text item delimiters to tmp
	return theText
end replaceText
