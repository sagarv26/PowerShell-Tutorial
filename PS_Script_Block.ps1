
Invoke-Command -ScriptBlock { Get-Process }

#Invoke-Command can also execute script blocks that have parameter blocks.
Invoke-Command -ScriptBlock { param($p1, $p2)
"p1: $p1"
"p2: $p2"
} -ArgumentList "First", "Second"

#use variables to store and execute script blocks. 
$a = { Get-Service BITS }
Invoke-Command -ScriptBlock $a

#Using Call Operator
$a ={ param($p1, $p2)
"p1: $p1"
"p2: $p2"
}

&$a -p2 "First" -p1 "Second"

$a = { 1 + 1}
$b = &$a
$b

$a = { 1 + 1}
$b = Invoke-Command $a
$b

Invoke-Command -ComputerName Server01 -ScriptBlock { 
    Start-Process "G:\Softwares\System-Softwares\vlc-3.0.6-win64.exe" -ArgumentList '/silent' -Wait
}

#Rename File Extension
param($Folder)

Write-Host "Before Renaming files...`n`n"
Get-ChildItem $Folder

Get-ChildItem "$Folder\*.txt" | 
Rename-Item -NewName { $_.name -Replace '.txt','.bak' }

Write-Host "`n`nAfter Renaming files...`n`n"
Get-ChildItem $Folder