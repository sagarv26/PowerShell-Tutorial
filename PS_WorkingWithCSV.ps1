
#Find All CSV Cmdlets
Get-Help *csv*

#Import content from Csv
$listOfRows = Import-Csv .\example.csv
$listOfRows

#Import from CSV and cast properties
$listOfRows = Import-Csv .\example.csv
$listOfRows | ForEach-Object {
#Cast properties
$_.DateTime = [datetime]$_.DateTime
$_.Integer = [int]$_.Integer
#Output object
$_
}

#Change property names in an imported object
Start-Job -ScriptBlock { Get-Process } | Export-Csv -Path .\Jobs.csv -NoTypeInformation
$Header = 'State', 'MoreData', 'StatusMessage', 'Location', 'Command', 'StateInfo', 'Finished', 'InstanceId', 'Id', 'Name', 'ChildJobs', 'BeginTime', 'EndTime', 'JobType', 'Output', 'Error', 'Progress', 'Verbose', 'Debug', 'Warning', 'Information'
# Delete the default header from file
$A = Get-Content -Path .\Jobs.csv
$A = $A[1..($A.Count - 1)]
$A | Out-File -FilePath .\Jobs.csv
$J = Import-Csv -Path .\Jobs.csv -Header $Header
$J

#Exporting Objects as CSV
Get-Process -Name WmiPrvSE | Select-Object -Property BasePriority,Id,SessionId,WorkingSet |
Export-Csv -Path .\WmiData.csv -NoTypeInformation

Get-Process | Export-Csv -Path .\Processes.csv -Delimiter ';' -NoTypeInformation


#Conversion
#ConvertTo-Csv
Get-Process -Name pwsh | ConvertTo-Csv -NoTypeInformation

#ConvertFrom-Csv
$P = Get-Process | ConvertTo-Csv
$P | ConvertFrom-Csv