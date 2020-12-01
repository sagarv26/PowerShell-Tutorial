

# Using PowerShell commnads to create a new file
$Location = "E:\PS_Output"
New-Item -Path $Location -Name "FirstCreateFile.txt" -ItemType File -Force


# Here I define the folders and the extensions to look at.
$folder1 = ls "E:\PS_Output\Directory1\" -recurse -include "*.csv"
$destinationfolder = "E:\PS_Output\Directory2\"
Copy-Item -Path $folder1 -Destination $destinationfolder

#Read and Rename File
Get-Content "E:\PS_Output\git.txt"
Rename-Item "E:\PS_Output\git.txt" git-commands.txt

$Dir = get-childitem C:\windows\system32 
$List = $Dir | where {$_.extension -eq ".dll"}
$List

Move-Item $folder1  "E:\PS_Output\New folder"

Remove-Item "E:\PS_Output\Directory2" -Recurse -Force