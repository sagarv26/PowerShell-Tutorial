#The Enable-PSRemoting cmdlet configures the computer to receive Windows PowerShell remote commands 
#that are sent by using the WS-Management technology. 
#The Disable-PSRemoting cmdlet prevents users on other computers from running commands on the local computer.
Enable-PSRemoting -Force
Disable-PSRemoting -Force


#The Enter-PSSession cmdlet starts an interactive PowerShell session with a single remote computer. 
#During the session, the commands that you type run on the remote computer, 
#just as though you were typing directly on the remote computer. You can have only one interactive session at a time.

Enter-PSSession -Computer RemoteHost
Enter-PSSession 192.168.1.1 -Credential $(Get-Credential)

#This command creates a new PSSession on the local computer and saves the PSSession in the $s variable.
$Session = New-PSSession -ComputerName "RemoteComputerName"



#This command creates a new PSSession on the Server01 computer and saves it in the $Server01 variable
 $Server01 = New-PSSession -ComputerName Server01
 $s1, $s2, $s3 = New-PSSession -ComputerName Server01,Server02,Server03

 Invoke-Command -Session $Server01 -ScriptBlock {write-host "This is running on
$ENV:ComputerName"}

#Best practise for automatically cleaning-up PSSessions

try
{
$session = New-PSsession -Computername "RemoteMachineName"
Invoke-Command -Session $session -ScriptBlock {write-host "This is running on
$ENV:ComputerName"}
}
catch
{
Write-Output "ERROR: $_"
}
finally
{
if ($session)
{
Remove-PSSession $session
}
}