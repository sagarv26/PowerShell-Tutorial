
#To display basic information
Get-Help Format-Table
Get-Help -Name Format-Table
Format-Table -?

#To Display basic information one page at a time
help Format-Table
man Format-Table
Get-Help Format-Table | Out-Host -Paging

#Display more information for a cmdlet
Get-Help Format-Table -Detailed
Get-Help Format-Table -Full

#Display selected parts of a cmdlet by using parameters
Get-Help Format-Table -Examples
Get-Help Format-Table -Parameter GroupBy
Get-Help Format-Table -Parameter *

#Display online version of help
Get-Help Format-Table -Online

#Display help about the help system and available help topics
Get-Help 
Get-Help *

#Display a list of topics that include a word
Get-Help host