<#
.Synopsis
Short description
.DESCRIPTION
Long description
.EXAMPLE
Example of how to use this cmdlet
.EXAMPLE
Another example of how to use this cmdlet
.INPUTS
Inputs to this cmdlet (if any)
.OUTPUTS
Output from this cmdlet (if any)
.NOTES
General notes
.COMPONENT
The component this cmdlet belongs to
.ROLE
The role this cmdlet belongs to
.FUNCTIONALITY
The functionality that best describes this cmdlet
#>
function Verb-Noun
{
[CmdletBinding(DefaultParameterSetName='Parameter Set 1',
SupportsShouldProcess=$true,
PositionalBinding=$false,
HelpUri = 'http://www.microsoft.com/',
ConfirmImpact='Medium')]
[Alias()]
[OutputType([String])]
Param
(
# Param1 help description
[Parameter(Mandatory=$true,
ValueFromPipeline=$true,
ValueFromPipelineByPropertyName=$true,
ValueFromRemainingArguments=$false,
Position=0,
ParameterSetName='Parameter Set 1')]
[ValidateNotNull()]
[ValidateNotNullOrEmpty()]
[ValidateCount(0,5)]
[ValidateSet("sun", "moon", "earth")]
[Alias("p1")]
$Param1,
# Param2 help description
[Parameter(ParameterSetName='Parameter Set 1')]
[AllowNull()]
[AllowEmptyCollection()]
[AllowEmptyString()]
[ValidateScript({$true})]
[ValidateRange(0,5)]
[int]
$Param2,
# Param3 help description
[Parameter(ParameterSetName='Another Parameter Set')]
[ValidatePattern("[a-z]*")]
[ValidateLength(0,15)]
[String]
$Param3
)

Begin
{
}
Process
{

Write-Host $Param1
if ($pscmdlet.ShouldProcess("Target", "Operation"))
{
}
}
End
{
}
}

#Mandatory and Range Validation
function Get-Square()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateRange(1,5)]
        [double]$value
    )
    return $value * $value   
}

try {
 
 Get-Square -value 999

} catch {

 write-host "Exception Message: $($_.Exception.Message)"

}


#Not Null or Empty Validation
function Get-Posessive()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$value
    )

    if($value.Substring($value.Length - 1, 1) -eq 's')
    {
        $result = $value + ''''
    }
    else
    {
        $result = $value + '''s'
    }
    return $result
}

Get-Posessive "Rahul"


#Length Validation
function Check-ZipCode()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateLength(1,5)]
        [string]$value
    )
    return $value
}

Check-ZipCode 555555


#Pattern Validation
function Check-ZipCode()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidatePattern('^\d{5}$|^\d{5}-\d{4}$')]
        [string]$value
    )
    return $value
}

Check-ZipCode 12345-6789555

#Script Validation
function Get-Reciprocal()
{

    [CmdletBinding(DefaultParameterSetName='Parameter Set 1',
    SupportsShouldProcess=$true,
    HelpUri = 'http://www.microsoft.com/',
    ConfirmImpact='Medium')]
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateScript({$_ -ne 0})]
        [double]$value
    )

    return 1 / $value   
}

Get-Reciprocal 10 -Confirm:$false

