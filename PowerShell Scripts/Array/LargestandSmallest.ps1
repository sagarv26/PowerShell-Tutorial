#array of 10 numbers
$a=@(32,43,53,54,32,65,63,98,43,23)
	

$largest=$a[0]
$smallest=$a[0]
		
		for($i=1; $i -lt $a.length; $i+=1)
		{
			if($a[$i] -gt $largest){
				$largest = $a[$i]
               }
			elseif ($a[$i] -lt $smallest){
              $smallest = $a[$i]
            }
			
		}
		
Write-Host "Largest Number is : "  $largest
Write-Host "Smallest Number is : " $smallest