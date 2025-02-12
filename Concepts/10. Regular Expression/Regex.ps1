#Sample text
$text = @"
This is (a) sample
text, this is
a (sample text)
"@
#Sample pattern: Content wrapped in ()
$pattern = '\(.*?\)'

<#
.  – means “anything”
*  – means “zero or more of it”
.* – means “zero or more of anything”
?  - means "Zero or one time."
#>

$text -match $pattern
$Matches
$Matches[0]

"One","Two","Three" | Where-Object {$_ -match "T.*"} | Foreach {$Matches[0]}

#You can also use -match to filter through an array of strings and only return the strings containing a match.
$textarray = @"
This is (a) sample
text, this is
a (sample text)
()
"@ -split "`n"

$textarray -match $pattern


#PowerShell 2.0 introduced a new cmdlet for searching through text using regex. It returns a MatchInfo object per
#textinput that contains a match. You can access it's properties to find matching groups
$m = Select-String -InputObject $text -Pattern $pattern

$m

$m | Format-List *


#Like -match, Select-String can also be used to filter through an array of strings by piping an array to it. It creates a
#MatchInfo-object per string that includes a match.
$textarray | Select-String -Pattern $pattern


#You can also access the matches, groups etc.
$textarray | Select-String -Pattern $pattern | fl *


#Select-String can also search using a normal text-pattern (no regex) by adding the -SimpleMatch switch.

#You can also use the static Match() method available in the .NET [RegEx]-class.
[regex]::Match($text,$pattern)


[regex]::Match($text,$pattern) | Select-Object -ExpandProperty Value


#A common task for regex is to replace text that matches a pattern with a new value.
#Sample text
$text = @"
This is (a) sample
text, this is
a (sample text)
"@

#Sample pattern: Text wrapped in ()
$pattern = '\(.*?\)'
#Replace matches with:
$newvalue = 'test'



#The -replace operator in PowerShell can be used to replace text matching a pattern with a new value using the
#syntax 'input' -replace 'pattern', 'newvalue'.
$text -replace $pattern, $newvalue


#Replacing matches can also be done using the Replace() method in the [RegEx] .NET class.
[regex]::Replace($text, $pattern, 'test')


<#A regex-pattern uses many special characters to describe a pattern. Ex., . means "any character", + is "one or more"
etc.
To use these characters, as a .,+ etc., in a pattern, you need to escape them to remove their special meaning. This is
done by using the escape character which is a backslash \ in regex. Example: To search for +, you would use the
pattern \+.
It can be hard to remember all special characters in regex, so to escape every special character in a string you want
to search for, you could use the [RegEx]::Escape("input") method.#>

[regex]::Escape("(foo)")


[regex]::Escape("1+1.2=2.2")



#Let's make a little list of words
$words = "The quick brown fox jumped over the lazy dog".Split()
 
#Now show only words that start with a letter between "a" and "l" and also have an "o" somewhere in the word.
$Words | Where {$_ -match "[A-L,a-l].*o.*"} | Foreach {$Matches[0]}