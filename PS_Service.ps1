#Get All Service
Get-Service

#Get all service where name starts with se
Get-Service -Name tom*

#Get all service where DisplayName starts with se
Get-Service -DisplayName se*

#Get-Service to get the services on remote computers
Get-Service -ComputerName Server01

#Start, Stop, Suspend, Restart Service
Stop-Service -DisplayName 'Apache Tomcat 8.5 Tomcat8'

Start-Service -Name Tomcat8

Suspend-Service -Name service

Restart-Service -Name Tomcat8