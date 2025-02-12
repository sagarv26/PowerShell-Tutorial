Function Get-EmptyDirectory {
<#
.SYNOPSIS
    Get empty directories using underlying Get-ChildItem cmdlet
 
.NOTES
    Name: Get-EmptyDirectory
    Version: 1.0
    DateCreated: 2021-Oct-2
  
.LINK
     
  
.EXAMPLE
    Get-EmptyDirectory -Path \\Server\Share\Folder -Depth 2 
#>
 
    [CmdletBinding()]
 
    param(
        [Parameter(
            Mandatory = $true,
            Position = 0
        )]
        [string]    $Path,
 
        [Parameter(
            Mandatory = $false,
            Position = 1
        )]
        [switch]    $Recurse,
 
        [Parameter(
            Mandatory = $false,
            Position = 2
        )]
        [ValidateRange(1,15)]
        [int]    $Depth
    )
 
    BEGIN {}
 
    PROCESS {
        try {
            $ItemParams = @{
                Path      = $Path
                Directory = $true
            }
            if ($PSBoundParameters.ContainsKey('Recurse')) {
                $ItemParams.Add('Recurse',$true)
            }
 
            if ($PSBoundParameters.ContainsKey('Depth')) {
                $ItemParams.Add('Depth',$Depth)
            }
            $FolderList = Get-ChildItem @ItemParams | select -ExpandProperty FullName
 
            foreach ($Folder in $FolderList) {
                if (-not (Get-ChildItem -Path $Folder)) {
                    [PSCustomObject]@{
                        EmtpyDirectory = $true
                        Path           = $Folder
                    }
                } else {
                    [PSCustomObject]@{
                        EmtpyDirectory = $false
                        Path           = $Folder
                    }
                }
            }
        } catch {
            Write-Error $_.Exception.Message
        }
    }
 
    END {}
}