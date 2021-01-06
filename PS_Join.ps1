
#join Operator
-join ("Windows", "PowerShell", "2.0")


#The following statement joins three strings delimited by a space
"Windows", "PowerShell", "2.0" -join "-"


#The following statements use a multiple-character delimiter to join three strings
$a = "WIND", "S P", "ERSHELL"
$a -join "OW"

#The following statement joins the lines in a here-string into a single string
$a = @'
a
b
c
'@

(-split $a) -join " "

$array=@('Rahul','Sharath','Dravid')
$array -join " "



