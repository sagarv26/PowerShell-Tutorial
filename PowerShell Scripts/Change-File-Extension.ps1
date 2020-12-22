#Rename File Extension
param($Folder)

Write-Host "Before Renaming files...`n`n"
Get-ChildItem $Folder

Get-ChildItem "$Folder\*.txt" | 
Rename-Item -NewName { $_.name -Replace '.txt','.bak' }

Write-Host "`n`nAfter Renaming files...`n`n"
Get-ChildItem $Folder