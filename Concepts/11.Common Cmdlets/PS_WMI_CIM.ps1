<#
Windows Management Instrumentation (WMI) is a Microsoft-developed system 
that manages data and operations for Windows-based systems. 
It's used to monitor systems, 
automate administrative tasks, and share management information. 

CIM (Common Information Model) is a standardized way of 
monitoring health performance for 
computer hardware such as servers and storage.
#>

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

Get-CimInstance -ClassName Win32_ComputerSystem | Format-List


#Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration

#Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration

#Using a filter
Get-WmiObject -Class Win32_Process -Filter "Name = 'snmp.exe'"

Get-CimInstance -ClassName Win32_Process -Filter "Name = 'powershell.exe'"


#Using a WQL-query:
Get-CimInstance -Query "SELECT * FROM Win32_Process WHERE Name = 'snmp.exe'"

$session = New-CimSession -ComputerName "" -C