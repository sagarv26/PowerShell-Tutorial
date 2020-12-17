

#To Get List
Get-WmiObject -List

Get-CimClass

Get-WmiObject -List -Class "*Process*"

Get-CimClass -ClassName "*Process*"


Get-WmiObject -Class "__Namespace" -Namespace "root"

Get-CimClass -Namespace "root/SecurityCenter2"


#Win32_BIOS
Get-WmiObject -Class Win32_BIOS

Get-CimInstance -ClassName Win32_BIOS

#Win32_ComputerSystem
Get-WmiObject -Class Win32_ComputerSystem

Get-CimInstance -ClassName Win32_ComputerSystem


#Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration

#Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration

#Using a filter
Get-WmiObject -Class Win32_Process -Filter "Name = 'powershell.exe'"

Get-CimInstance -ClassName Win32_Process -Filter "Name = 'powershell.exe'"


#Using a WQL-query:
Get-CimInstance -Query "SELECT * FROM Win32_Process WHERE Name = 'powershell.exe'"