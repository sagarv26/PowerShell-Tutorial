

$A = Get-ChildItem G:\ps-test\File1.txt
$A | Add-Member -NotePropertyName Status -NotePropertyValue Done -Force
$A.Status


$A = Get-ChildItem G:\ps-test\File1.txt
$A | Add-Member -MemberType AliasProperty -Name Size -Value length
$A.Size

$A = Get-ChildItem G:\ps-test\File1.txt
$S = {$this.Length / 1MB} 
$A | Add-Member -MemberType ScriptMethod -Name "SizeInMB" -Value $S
$A.SizeInMB()

$A = "A string"
$A = $A | Add-Member -NotePropertyMembers @{StringUse="Display"} -PassThru
$A.StringUse


function Copy-Property ($From, $To)
{
    $properties = Get-Member -InputObject $From -MemberType NoteProperty
    foreach ($p in $properties)
    {
        $To | Add-Member -MemberType NoteProperty -Name $p.Name -Value $From.$($p.Name) -Force
    }
}

Copy-Property -From $A -To $B


$Asset = New-Object -TypeName PSObject
$d = [ordered]@{Name="Server30";System="Server Core";PSVersion="4.0"}
$Asset | Add-Member -NotePropertyMembers $d -TypeName Asset
$Asset | Get-Member

