
$parameters = @{
  Name = "myNuGetSource"
  SourceLocation = "https://www.myget.org/F/powershellgetdemo/api/v2"
  PublishLocation = "https://www.myget.org/F/powershellgetdemo/api/v2/Packages"
  InstallationPolicy = 'Trusted'
}
Register-PSRepository @parameters

Get-PSRepository
Set-PSRepository -Name "Name" -InstallationPolicy Trusted

Find-Module SimplySql
Find-Module *Sql

Find-Module -Name PowerShellGet | Install-Module
Install-Module -Name SpeculationControl


Uninstall-Module -Name xActiveDirectory
Get-InstalledModule -Name SpeculationControl | Uninstall-Module

Update-Module -Name SpeculationControl