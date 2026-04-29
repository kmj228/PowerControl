Set objShell = CreateObject("WScript.Shell")
Dim exePath
exePath = Replace(WScript.ScriptFullName, "start.vbs", "DeviceManager.exe")
objShell.Run Chr(34) & exePath & Chr(34), 0, False
