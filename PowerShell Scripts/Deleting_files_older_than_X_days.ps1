#delete files older than 30 days
param($Folder)

Write-Host "Before Deleting...`n"
Get-ChildItem $Folder

Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-30)} |
ForEach-Object {
   $_ | Remove-Item -Force
   $_.FullName | Out-File "$Folder\deletedbackups.txt" -Append
}

Write-Host "`n`nAfter Deleting...`n"
Get-ChildItem $Folder

Write-Host "`n`nBackup File:`n"
Get-Content "$Folder\deletedbackups.txt"