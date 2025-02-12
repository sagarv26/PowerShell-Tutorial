$Content = Get-Content C:\Powershell_replace.txt
$Content.replace(‘tiger’,’dog’) | Set-Content C:\Powershell_replace.txt
Get-Content C:\Powershell_replace.txt


$FileList = Get-ChildItem C:\DCconfigs\ | select FullName
 
$FileList | ForEach-Object {
    (Get-Content $_.FullName).replace("DC01.ad.thesysadminchannel.com","DC03.ad.thesysadminchannel.com").Replace("10.0.0.101","10.0.0.103") | Set-Content $_.FullName
}