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


try {
    Start-Service -Name 'Apache Tomcat 8.5 Tomcat8' 
} catch {
    # Examine and play with one of the following objects
    Write-Host "$($error[0].Exception)"
    Write-Host "$($_.exception)"
}

Suspend-Service -Name service

Restart-Service -Name Tomcat8