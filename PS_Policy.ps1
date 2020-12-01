
#To get the effective execution policy for the current PowerShell session, use the Get-ExecutionPolicy cmdlet.
Get-ExecutionPolicy

#To get all of the execution policies that affect the current session and display them in precedence order
Get-ExecutionPolicy -List

#To change the PowerShell execution policy on your Windows computer, use the Set-ExecutionPolicy cmdlet
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#To remove the execution policy for a particular scope, set the execution policy to Undefined.
Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope LocalMachine