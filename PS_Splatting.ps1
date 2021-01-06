#Splatting using HashTable
$splat = @{
Class = "Win32_SystemEnclosure"
Property = "Manufacturer"
ErrorAction = "Stop"
}
Get-WmiObject @splat
Get-WmiObject -ComputerName "Computer2" @splat
Get-WmiObject -ComputerName "Computer3" @splat


$Colors = @{ForegroundColor = "black"; BackgroundColor = "white"}
#Write a message with the colors in $Colors
Write-Host "This is a test." @Colors

#Write second message with same colors. The position of splatted
#hash table does not matter.
Write-Host @Colors "This is another test."

$splat = @{
ComputerName = $env:COMPUTERNAME
Class = "Win32_SystemEnclosure"
Property = "Manufacturer"
ErrorAction = "Stop"
}

Get-WmiObject @splat

$MyParameters = @{
Name = "chrome"
FileVersionInfo = $true
}

Get-Process @MyParameters 


#if the splat is not indented for reuse
@{
ComputerName = $env:COMPUTERNAME
Class = "Win32_SystemEnclosure"
Property = "Manufacturer"
ErrorAction = "Stop"
} | % { Get-WmiObject @_ }

#Without Using Splatting 
Copy-Item "G:\PS-Test\deletedbackups.txt" "G:\PS-Test\deletedbackups2.txt" -WhatIf

#Splatting using Array
$ArrayArguments = "G:\PS-Test\deletedbackups.txt", "G:\PS-Test\deletedbackups2.txt"
Copy-Item @ArrayArguments 

#Using the ArgumentList parameter
$array = 'Hello', 'World!'
Invoke-Command -ScriptBlock {
  param([string[]]$words) $words -join ' '
  } -ArgumentList $array

$array = 'Hello', 'World!'
Invoke-Command -ScriptBlock {
  param([string[]]$words) $words -join ' '
  } -ArgumentList (,$array)


Function Outer-Method
{
Param
(
[string]
$First,
[string]
$Second
)

Write-Host "`n`nPS Bound" $PSBoundParameters
Write-Host $First -NoNewline

Inner-Method @PSBoundParameters

}

Function Inner-Method
{
Param
(
[string]
$Second
)

Write-Host (" {0}!" -f $Second)
}


$parameters = @{
First = "Hello"
Second = "World"
}

Outer-Method @parameters
