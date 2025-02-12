

$objects = @{
  ReferenceObject = (Get-Content -Path G:\PS-Test\File3.txt)
  DifferenceObject = (Get-Content -Path G:\PS-Test\File4.txt)
}
Compare-Object @objects -IncludeEqual 


$a = $True
Compare-Object -IncludeEqual $a $a
(Compare-Object -IncludeEqual $a $a) | Get-Member


$a = $True
Compare-Object -IncludeEqual $a $a -PassThru
(Compare-Object -IncludeEqual $a $a -PassThru) | Get-Member

(Compare-Object -IncludeEqual $a $a -PassThru).SideIndicator


Compare-Object -ReferenceObject 'abc' -DifferenceObject 'xyzaa' -Property Length -IncludeEqual

Get-Process chrome
$a = Get-Process -Id 1168
$b = Get-Process -Id 1248

Compare-Object $a $b -IncludeEqual
Compare-Object $a $b -Property ProcessName, Id, CPU

Compare-Object -ReferenceObject ([TimeSpan]"0:0:1") -DifferenceObject "0:0:1" -IncludeEqual
Compare-Object -ReferenceObject "0:0:1" -DifferenceObject ([TimeSpan]"0:0:1") -IncludeEqual
