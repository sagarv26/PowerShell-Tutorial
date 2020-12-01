 
#Below command gets the Notepad process and then stops it.
Get-Process notepad | Stop-Process

#This example shows how to sort all the processes on the 
#computer by the number of open handles in each process
Get-Process | Sort-Object -Property handles

#This example shows how to use the Format-List cmdlet to
#display a list of properties for a process object.
Get-Process winlogon | Format-List -Property *