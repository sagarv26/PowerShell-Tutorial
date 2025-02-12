


Add-Content -Path G:\PS-Test\File1.txt -Value "`nEnd of file" -PassThru

Add-Content -Path "G:\PS-Test\file1.txt" -Value (Get-Module) -PassThru
Get-Content -Path "G:\PS-Test\file1.txt"



New-Item -Path G:\PS-Test\IsReadOnlyTextFile.txt -ItemType File
Set-ItemProperty -Path G:\PS-Test\IsReadOnlyTextFile.txt -Name IsReadOnly -Value $True
Get-ChildItem -Path G:\PS-Test\IsReadOnlyTextFile.txt
Add-Content -Path G:\PS-Test\IsReadOnlyTextFile.txt -Value 'Add value to read-only text file' 
Get-Content -Path G:\PS-Test\IsReadOnlyTextFile.txt