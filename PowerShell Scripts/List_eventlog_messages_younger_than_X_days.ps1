Clear-Host
# Date calculation with .AddDays()
$DateCut = (Get-Date).AddDays(-7)

Get-EventLog -ComputerName $server -EntryType Error | 
Where-Object {$_.TimeWritten -ge $DateCut} |
export-csv -Path "" -NoTypeInformation -Append


#Multiple Servers
$server = import-csv ""

foreach($server in $servers){
Get-EventLog -ComputerName $server -EntryType Error | 
Where-Object {$_.TimeWritten -ge $DateCut} |
export-csv -Path "" -NoTypeInformation -Append
}