
#The following command gets the property of objects.
Get-ChildItem $pshome\PowerShell.exe | Get-Member -MemberType property

#following command gets the static properties of the System.DateTime class.
Get-Date | Get-Member -MemberType Property -Static

[System.DateTime]::UtcNow


#Script to get the size of Folder
$ParentFolder = 'E:\swe'

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