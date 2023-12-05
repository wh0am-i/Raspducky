Set WshShell = CreateObject("WScript.Shell")
WshShell.Run """" & "p.bat" & """", 0, False
Set WshShell = Nothing
