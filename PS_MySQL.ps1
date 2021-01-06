
#Install SQL Module
Install-Module -Name SimplySql

Get-Module SimplySQL
Import-Module SimplySQL

#Build Connection
Open-MySQLConnection -Server "localhost" -Port "3360" -Credential "root" -Database "identityiq"

#Execute Query
Invoke-SqlQuery -Query "select * from spt_identity" | Format-Table