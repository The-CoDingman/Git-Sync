;Last updated 01/14/2025 at 4:20am
#Requires AutoHotkey v2
#SingleInstance Force
CheckForUpdates()

CheckForUpdates() {
    Try {		
		WinHttp := ComObject("WinHttp.WinHttpRequest.5.1")
		WinHttp.Open("GET", "https://raw.githubusercontent.com/The-CoDingman/Git-Sync/refs/heads/main/Git%20Sync%.ahk")
		WinHttp.Send()
		WinHttp.WaitForResponse()
		ResponseText := WinHttp.ResponseText
        FileContents := FileRead(A_ScriptFullPath)
        if (FileContents != ResponseText) {
            if (MsgBox("There is a newer version of this script available. Would you like to update now?", "New Version Found", "262148") = "Yes") {
                tFile := FileOpen(A_ScriptFullPath, "w")
                tFile.Write(ResponseText)
                tFile.Close()
                Reload()
            }
        }
	}
	Catch {
		MsgBox("Something went wrong", "Error", "262144")
	}
}