$myinvocation.mycommand.name
$a=Read-Host Enter any word to check

$b = $a.ToCharArray()

[array]::reverse($b)

$c = -join($b)


if($a -eq $c){

Write-Host $a is a palindrome

}else{

Write-Host $a is not a palindrome
}

