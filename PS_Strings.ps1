
#Double-quoted strings
$myString = "Some basic text"
$variable = 007
$mySecondString = 'String with a variable $variable'

Write-Host $myString
Write-Host $mySecondString

$myString = "A `"double quoted`" string which also has 'single quotes'."
$myString

#Literal String
$myLiteralString = 'Simple text including special characters (`n) and a $variable-reference'
Write-Host $myLiteralString

#Here String
$hereString = @"
Simple
Multiline string
with "quotes"
"@

$hereStringLiteral = @"
The following line won't be expanded
$(Get-Date)
because this is a literal here-string
"@
$hereStringLiteral

#Special characters
"This`tuses`ttab`nThis is on a second line"

"`"String`""

#String Formatting
$s1="Windows PowerShell"  
$s2="POINT"  
$formattedString = "{0} {1}...." -f $s1,$s2  
$formattedString  


#Concatenating strings
#Using variables in a string
$string1 = "Power"
$string2 = "Shell"
"Greetings from $string1 $string2" 


#Using the + operator
$string1 = "Greetings from"
$string2 = "PowerShell"
$string1 + " " + $string2

"The title of this console is '" + $host.Name + "'"

#Using subexpressions
"Tomorrow is $((Get-Date).AddDays(1).DayOfWeek)"


#String Replace
$s1="Windows Powerxhell"  
$s1.replace("x","S")

$s1.Substring(2,7)  