

$P = Get-Process chrome | ConvertTo-Csv
$P | ConvertFrom-Csv


$Date = Get-Date | ConvertTo-Csv -Delimiter ';'
ConvertFrom-Csv -InputObject $Date -Delimiter ';'


$J = Start-Job -ScriptBlock { Get-Process chrome } | ConvertTo-Csv  -NoTypeInformation
$Header = 'State', 'MoreData', 'StatusMessage', 'Location', 'Command', 'StateInfo', 'Finished', 'InstanceId', 'Id', 'Name', 'ChildJobs', 'BeginTime', 'EndTime', 'JobType', 'Output', 'Error', 'Progress', 'Verbose', 'Debug', 'Warning', 'Information'
# Delete the default header from $J
$J = $J[1..($J.count - 1)]
$J | ConvertFrom-Csv -Header $Header


(Get-Culture).TextInfo.ListSeparator
$Services = (Get-Service ALG | ConvertTo-Csv)
ConvertFrom-Csv -InputObject $Services -UseCulture