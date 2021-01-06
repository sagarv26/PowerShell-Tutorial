
#Use the following command to create a Modules directory for the current user
New-Item -Type Directory -Path $HOME\Documents\WindowsPowerShell\Modules

#Copy the entire module folder into the Modules directory.
Copy-Item -Path "C:\Program Files\WindowsPowerShell\Modules\SimplySql\" -Destination `
   "$HOME\Documents\WindowsPowerShell\Modules" -Recurse -Force

#To find modules that are installed in a default module location
Get-Module -ListAvailable

#To find the modules that have already been imported into your session
Get-Module

#Use the Get-Command cmdlet to find all available commands
Get-Command -Module module-name

#Import a Module
Import-Module module-name

#To add the TestCmdlets module in the C:\ps-test directory to your session
Import-Module C:\ps-test\TestCmdlets

#To add the TestCmdlets.dll module in the C:\ps-test directory to your session
Import-Module C:\ps-test\TestCmdlets.dll

#PSModulePath
$env:PSModulePath