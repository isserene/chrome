Set oShell = CreateObject ("Wscript.Shell") 
strPath = Wscript.ScriptFullName
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile(strPath)
strFolder = objFSO.GetParentFolderName(objFile) 

Dim NRun, WU
Set WU = CreateObject("Wscript.shell")
NRun = True
For Each ps In Getobject("winmgmts:\\.\root\cimv2:win32_process").instances_
If UCase(ps.name) = UCase("python.exe") Then ps.terminate : NRun = False
Next

Dim strArgs
quo = """"
strArgs = quo & strFolder & "\python27\1.0\python.exe" & quo & " " & quo & strFolder & "\launcher\start.py " & quo
oShell.Run strArgs, 0, false
strArgs = quo & strFolder & "\GoogleChrome.exe" & quo
oShell.Run strArgs, 0, false



