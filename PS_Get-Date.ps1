
#This command gets a DateTime object, but it displays only the date. 
#It uses the -DisplayHint parameter to indicate that only the date is to be displayed
Get-Date -DisplayHint Date

#General Formate
Get-Date -Format g

Get-Date -Format “dddd MM/dd/yyyy HH:mm K”

#This command gets the current date and time and formats it as specified by the command.
Get-Date -UFormat "%Y / %m / %d / %A / %Z"

#This command displays the day of the year for the current date. 
#For example, December 31 is the 365th day of 2006, but it is the 366th day of 2000.
(Get-Date -Year 2000 -Month 12 -Day 31).DayOfYear

#Creates a variable named $a and then assigns the object retrieved by Get-Date to the $a variable.
$a = Get-Date
#Variable uses the IsDaylightSavingTime method on the object in $a.
$a.IsDaylightSavingTime()
#To convert the current date and time to UTC time.
$a.ToUniversalTime()

#Below command uses the -Format parameter with a value of "o" to generate a timestamp string.
Get-Date -Format o
#Below command prepares the timestamp to be used in a directory name.
$timestamp = Get-Date -Format o | foreach {$_ -replace ":", "."}
#To create a directory with the name in the $timestamp variable.
mkdir C:\ps-test\$timestamp