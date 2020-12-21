#Script to get the size of Folder
param ($ParentFolder)
#$ParentFolder = 'E:\swe'

Write-Host Script Name: $MyInvocation.MyCommand.Name

$Folders = Get-ChildItem $ParentFolder 

$AllFoldersSize = @()
ForEach ($Folder in $Folders) {

    If ($Folder.PSIsContainer -eq $true) {
        $Size = $null
        $Size = (Get-ChildItem $Folder.FullName -Recurse |
          ?{$_.PSIsContainer -eq $false}| 
         Measure -sum -Property Length | select -ExpandProperty sum) / 1KB
        
        $Property = @{Folder = ($Folder.FullName);SizeInKB = ("{0:N2}" -f $Size)}
        $FolderObject = New-Object psobject -Property $Property
        $AllFoldersSize += $FolderObject
}

}

$AllFoldersSize




