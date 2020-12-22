
#Find All CSV Cmdlets
Get-Help *csv*

#Import content from Csv
$listOfRows = Import-Csv 'E:\Data\Contrator.csv'
$listOfRows

#Import from CSV and cast properties
$listOfRows = Import-Csv 'E:\Data\samples\import_csv.csv'
$listOfRows | ForEach-Object {
#Cast properties
$_.DateTime = [datetime]$_.DateTime
$_.Integer = [int]$_.Integer
#Output object
$_
}

#Change property names in an imported object
Start-Job -ScriptBlock { Get-Process } | Export-Csv -Path 'E:\Data\samples\Jobs.csv' -NoTypeInformation
$Header = 'State', 'MoreData', 'StatusMessage', 'Location', 'Command', 'StateInfo', 'Finished', 'InstanceId', 'Id', 'Name', 'ChildJobs', 'BeginTime', 'EndTime', 'JobType', 'Output', 'Error', 'Progress', 'Verbose', 'Debug', 'Warning', 'Information'
# Delete the default header from file
$A = Get-Content -Path 'E:\Data\samples\Jobs.csv'
$A = $A[1..($A.Count - 1)]
$A | Out-File -FilePath 'E:\Data\samples\Jobs.csv'
$J = Import-Csv -Path 'E:\Data\samples\Jobs.csv' -Header $Header
$J

#Exporting Objects as CSV
Get-Process -Name AuthManSvr | Select-Object -Property BasePriority,Id,SessionId,WorkingSet |
Export-Csv -Path 'E:\Data\samples\WmiData.csv' -NoTypeInformation

Get-Process | Export-Csv -Path 'E:\Data\samples\WmiData1.csv' -Delimiter ';' -NoTypeInformation


#Conversion
#ConvertTo-Csv
Get-Process -Name armsvc | ConvertTo-Csv -NoTypeInformation

#ConvertFrom-Csv
$P = Get-Process -Name armsvc| ConvertTo-Csv
$P | ConvertFrom-Csv