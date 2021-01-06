
#calling Path.GetFileName()
[System.IO.Path]::GetFileName('C:\Windows\explorer.exe')
explorer.exe

[System.Math]::Sqrt(16)


#Caling Non Static method
[System.DateTime]::AddHours(15)

$Object = [System.DateTime]::Now
$Object.AddHours(15)


#Load assembly
Add-Type -AssemblyName System.ServiceProcess
[System.ServiceProcess.ServiceController]

Add-Type -assembly Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::MsgBox("Do you agree?", "YesNoCancel,Question", "Question")





