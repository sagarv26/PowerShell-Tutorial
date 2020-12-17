
#Examining an object
Get-Item c:\windows | Get-Member

$Object = Get-Item C:\Windows
$Object.GetType()

#1 Creating a new object
$object = New-Object –TypeName PSObject
$object | Add-Member -MemberType NoteProperty –Name OSBuild –Value $os.BuildNumber
$object | Add-Member –MemberType NoteProperty –Name OSVersion –Value $os.Version
$object | Add-Member –MemberType NoteProperty –Name BIOSSerial –Value $os.SerialNumber
Write-Output $object

#PassThru
$object = New-Object –TypeName PSObject
$object | Add-Member –MemberType NoteProperty –Name OSBuild –Value $os.BuildNumber –PassThru |
Add-Member –MemberType NoteProperty –Name OSVersion –Value $os.Version –PassThru |
Add-Member –MemberType NoteProperty –Name BIOSSerial –Value $os.SerialNumber
Write-Output $object

#2 Creating a new object
$os | Select-Object –Property @{n='OSVersion1';e={$_.Version}},
@{n='OSBuild1';e={$_.BuildNumber}},
@{n='BIOSSerial1';e={$_.SerialNumber}}

$newObj = $os | Select-Object –Property @{n='OSVersion';e={$_.Version}},
@{n='OSBuild';e={$_.BuildNumber}},
@{n='BIOSSerial';e={$_.SerialNumber}}
$newObj

#3 Creating a new object
$newObject = [PSCustomObject][Ordered]@{
Name = $env:Username
ID = 12
Address = $null
}

#4 Creating a new object
$properties = @{'OSBuild'=$os.BuildNumber;
                'OSVersion'=$os.version;
                'BIOSSerial'=$os.SerialNumber}
$otherObj = New-Object –TypeName PSObject –Prop $properties
Write-Output $otherObj

$object = New-Object –TypeName PSObject –Prop
(@{'OSBuild'=$os.BuildNumber;
                'OSVersion'=$os.version;
                'BIOSSerial'=$bios.SerialNumber})
Write-Output $object

$info = @{}
$info.OSBuild=$os.BuildNumber
$info.OSVersion=$os.version
$info.BIOSSerial=$os.SerialNumber
$object = New-Object –TypeName PSObject –Prop $info
Write-Output $object
$info.Test = "Value"
$info.Remove("Test")
