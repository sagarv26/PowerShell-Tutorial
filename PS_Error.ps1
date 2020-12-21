$error.GetType()

$error.Count

$ErrorActionPreference = "Stop"

get-childitem "G:\FakeFolder" -ea SilentlyContinue
Write-Host "Test"

get-childitem "G:\FakeFolder" -ea "Inquire"



Try
{
Stop-Process -Id 123456 -ErrorAction stop


Write-host "Catch block not executed"
}
Catch
{
$_.exception.message
Write-Host "Non-Terminating Error: Invalid Process ID"
}


try
{
    <#
        Add dangerous code here that might produce exceptions.
        Place as many code statements as needed here.
        Non-terminating errors must have error action preference set to Stop to be caught.
    #>
 
    write-host "Attempting dangerous operation"
    $content = get-content -Path "C:\SomeFolder\This_File_Might_Not_Exist.txt" -ErrorAction Stop
}
catch
{
    <#
        You can have multiple catch blocks (for different exceptions), or one single catch.
        The last error record is available inside the catch block under the $_ variable.
        Code inside this block is used for error handling. Examples include logging an error,
        sending an email, writing to the event log, performing a recovery action, etc.
        In this example I'm just printing the exception type and message to the screen.
    #>
 
    write-host "Caught an exception:" -ForegroundColor Red
    write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
    write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red
}
finally
{
    <#
        Any statements in this block will always run even if errors are caught.
        This statement block is optional. Normally used for cleanup and
        releasing resources that must happen even under error situations.
    #>
 
    write-host "Finally block reached"
}



$error[0].Exception.GetType().FullName



$?

$LASTEXITCODE

#Invoking Terminating & Non-Terminating Errors
Write-host "Going to try a non terminating Error "
Write-Error "Non terminating"
Write-host "Going to try a terminating Error "
throw "Terminating Error "
Write-host "This Line won't be displayed"