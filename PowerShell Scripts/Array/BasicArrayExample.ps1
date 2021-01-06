#Basic Example of Array

$array=@()
$array=@(10,20,30,40)
$array+="A"
$array+="B"
$array+="Array"

$size = $array.Length

Write-Host Size of an array : $size`n
$count=0
foreach($a in $array){
$count+=1

Write-Host Element at $count :  $a

}


$ArrayList = [System.Collections.Arraylist]$array

$ArrayList.Reverse()

Write-Host `nArray in Reverse Order:`n
foreach($a in $ArrayList){
$count+=1

Write-Host Element at $count :  $a

}
