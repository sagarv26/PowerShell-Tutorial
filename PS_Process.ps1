
Get-Process

#Get Notepad process
Get-Process -Name note*

$A = Get-Process
$A | Get-Process | Format-Table -View priority

Start-Process notepad

Start-Process -FilePath "powershell" -Wait -WindowStyle Normal

Stop-Process -Name notepad -Confirm


$nid = (get-process notepad).id

stop-process -id $nid

wait-process -Name notepad -Timeout 5

