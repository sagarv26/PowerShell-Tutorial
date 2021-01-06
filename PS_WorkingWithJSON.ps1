
#Convert .NET object
Get-Date | Select-Object -Property * | ConvertTo-Json
(Get-UICulture).Calendar | ConvertTo-Json

#Convert from json
Get-Date | Select-Object -Property * | ConvertTo-Json | ConvertFrom-Json

#Get JSON strings from a web service and convert them to PowerShell objects
$response = Invoke-WebRequest -Uri 'https://jsonplaceholder.typicode.com/users' -UseBasicParsing
$response

$users = $response | ConvertFrom-Json

$users | FT