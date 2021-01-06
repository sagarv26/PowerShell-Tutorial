
function bubble_sort($a){

$n=$a.Length

for($i=1; $i -lt ($n); $i+=1)
{

    for($j=0; $j -lt ($n-$i); $j+=1)
    {

        if($a[$j] -le $a[$j+1])
        {

            $temp=$a[$j] 
            
            $a[$j]=$a[$j+1]            

            $a[$j+1]=$temp

        }

    }

}
return $a

}


$a=@()

$a=@(10,50,40,20,70,60,30)

Write-Host `nUnSorted Array : $a`n -ForegroundColor Cyan

$sorted=bubble_sort $a

Write-Host Sorted Array   : $sorted 




