
#the syntax for declaring an array variable
$array=@(1,2,3,5,6,7,8);

#To Create 32-bit integer array
[int32[]]$intA = 1500,2230,3350,4000

#GetType() method returns the type of the array. Type can be passed
$A = 1, 2, 3, 4
$A.getType()

#Checking the Size of an Array
$array.Length

#Initializing an Empty Array
$array = @()

#Accessing Array Elements
$array[0] + $array[1] + $array[2]


#Adding Elements to an Array
$array += 1
$array += 2
$array += 3

#Looping Through an Array Using a For Loop
for($i = 0; $i -lt $array.Length; $i++)
{
    $array[$i]
}

#Looping Through an Array Using a ForEach Loop
foreach($element in $array)
{
    $element
}

#Multi-Dimensional Arrays
$multi_array = @(1, 2, 3), @(4, 5, 6), @(7, 8, 9)

$array[0][0]  # 1
$array[2][2]  # 9