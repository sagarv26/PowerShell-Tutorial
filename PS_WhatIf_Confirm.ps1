

# PowerShell -WhatIf safety parameter
Get-Childitem "G:\PS-Test\" -Recurse | Remove-Item -WhatIf

# PowerShell -Confirm parameter
Get-Childitem "G:\PS-Test\" -Recurse | Remove-Item -Confirm

Remove-Item "G:\PS-Test\New folder" -Confirm:$false
