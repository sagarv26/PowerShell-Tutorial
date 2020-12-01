
#To create a new alias, use the New-Alias cmdlet
New-Alias -Name gh -Value Get-Date

#Creates or changes an alias for a cmdlet or other command in the current PowerShell session.
Set-Alias -Name list -Value Get-ChildItem

#To get all the aliases in the current session
Get-Alias

#Exports information about currently defined aliases to a file.
Export-Alias -Path E:\PS_Output\New-Alias.csv

#Imports an alias list from a file.
Import-Alias E:\PS_Output\New-Alias.csv