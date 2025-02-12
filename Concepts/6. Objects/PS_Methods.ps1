
#The following command gets the methods of process objects.
Get-Process | Get-Member -MemberType Method

#Invoke Methods
$notepad = Get-Process notepad
$notepad.Kill()

(Get-Process Notepad).Kill()

(Get-ChildItem G:\PS-Test\File1.txt).CopyTo("G:\PS-Test\final.txt")
(Get-ChildItem G:\PS-Test\File1.txt).CopyTo("G:\PS-Test\final.txt",$true)

#Example
$content = Get-Content -Path "G:\PS-Test\File1.txt"
$pattern = "could not find target directory"
$count = 0
$lineCount = 0
$log = $null

foreach($line in $content){
$lineCount++
if($res = $line.Contains($pattern)){
$log += "`nPattern found at line "+$lineCount
$count++

}
}
Write-Host `nTotal Pattern found: $count
Write-Host `n`nLog : $log