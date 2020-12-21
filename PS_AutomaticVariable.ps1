

Get-Variable

#OFS
$array = 1,2,3
"$array" # default OFS will be used

$OFS = " | " # we change OFS to comma and dot
"$array"


Wrie-Host "Hello"
$?

$array = 1, "string", $null


throw "Error" # resulting output will be in red font
$error[0] # resulting output will be normal string (not red )

$Error.Remove($Error[0])

$pid

$PSVersionTable


Get-ChildItem "E:\swe" -Recurse |
 ?{$_.PSIsContainer -eq $true}

$MyInvocation