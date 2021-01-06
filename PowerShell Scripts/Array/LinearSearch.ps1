
$array=@(10,20,50,40,60)

$key=60

for($i=0; $i -le ($array.Length -1); $i+=1){
    if ($key -eq $array[$i]) {

        $pos=$i+1
        Write-Host Key $key found at Position $pos 

    }
}