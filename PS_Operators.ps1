
#Arithmetic Operators
$a = 3
$b = 2

$a + $b    # 5
$a - $b    # 1
$a * $b    # 6
$a / $b    # 1.5
$a % $b    # 1
-$a        # -3


#Assignment Operators
$a = 3
$b = 2

$a += $b    # a = 5
$a -= $b    # a = 1
$a *= $b    # a = 6
$a /= $b    # a = 1.5
$a %= $b    # a = 1

#Comparison Operators
$a = 3
$b = 2

$a -eq $b    # False
$a -ne $b    # True
$a -lt $b    # False
$a -gt $b    # True
$a -le $b    # False
$a -ge $b    # True
$a -lt $b -and $b -lt $a    # False
$a -lt $b -or $b -lt $a     # True
$a -lt $b                   # False
-not ($a -lt $b)            # True

#Logical Operators
$a = 3
$b = 2

$a -lt $b -and $b -lt $a    # False
$a -lt $b -or $b -lt $a     # True
$a -lt $b                   # False
-not ($a -lt $b)            # True


#Split and Join Operators 
$a = 'Cat,Dog,Fish,Hamster'
$a -split ','                           # Cat
                                        # Dog
                                        # Fish
                                        # Hamster

$b = @('Cat','Dog','Fish','Hamster')
$b -join ','                            # Cat,Dog,Fish,Hamster

'Cat' + 'Dog' + 'Fish' + 'Hamster'      # CatDogFishHamster


#Unary Operators
$a = 1

$a++    # a = 2
$a--    # a = 0

#Call operator
$c = "get-executionpolicy"
$c

& $c


#Cast operator
[datetime]$birthday = "1/20/88"
[int64]$a = 34


#Comma operator
$myArray = 1,2,3
$SingleArray = ,1


#Format operator
"{0} {1,-20} {2}" -f 1,"hello",[math]::pi

#Range operator
$max=10
foreach ($a in 1..$max) {write-host $a}

#Property dereference operator
$myProcess.peakWorkingSet
(get-process PowerShell).kill()

#Static member operator
[datetime]::now

#Subexpression operator
$x=10
$($x * 23)
@(Get-WMIObject Win32_LocalTime)

"Today is $(Get-Date)"