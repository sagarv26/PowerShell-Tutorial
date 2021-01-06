

$a=@(10,20,30,40)

$s=$a.Length

$sum=0

foreach($i in $a){

$sum+=$i

}

$avg=$sum/$s

Write-Host Average of an Array: $avg