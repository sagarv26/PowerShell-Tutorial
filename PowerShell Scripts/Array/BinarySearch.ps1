

$a=@(10,20,30,40,50,60,70)

$key=60

$l=0
$h=$a.Length-1

while($l -le $h){


    $mid=($l+$h)/2
    $mid
    if($key -eq $a[$mid]){
        $pos=$mid+1
        Write-Host Key $key found at Position $pos
        break;
    }

    if($key -lt $a[$mid]){
        $h=$mid-1;
    }

    if($key -gt $a[$mid]){
        $l=$mid+1;
    }

}