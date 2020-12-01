
#To store your current location in the variable
$loc = Get-Location

# To display information about the contents of variables. 
$loc | Get-Member -MemberType Property

#Manipulating Variables
Get-Command -Noun Variable | Format-Table -Property Name,Definition -AutoSize -Wrap

#following command to clear all variables:
Remove-Variable -Name * -Force -ErrorAction SilentlyContinue

#Using Cmd.exe Variables
Get-ChildItem env:

$env:SystemRoot