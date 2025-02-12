<#syntax
function [<scope:>]<name> [([type]$parameter1[,[type]$parameter2])]
{
      param([type]$parameter1 [,[type]$parameter2])
      dynamicparam {<statement list>}
      begin {<statement list>}
      process {<statement list>}
}

function <function-name> {statements}
#>



#Simple Function with return
function Get-Time()
{
    return Get-Date -DisplayHint Date
}

Get-Time


# The Get-Square function returns the square (x^2) of 
#the value provided.
function Get-Square([int]$value)
{
  $result = $value * $value
  return $result
}

$value = Read-Host 'Enter a value'
$result = Get-Square $value
Write-Output "$value * $value = $result"


#Get-ByValue
function Get-ByValue($value)
{
    "`nvalue = $value"
    $value = 1
    "value = $value"
}

$x = 0
Get-ByValue $x
"x = $x"

#Get-ByReference
function Get-ByReference([ref]$ref)
{
    "`nref = " + $ref.value
    $ref.value = 1
    "ref = " + $ref.value
}

$x = 0
Get-ByReference ([ref]$x)
"x = $x"

#Positional Parameters
function Get-Args()
{
    foreach($arg in $args)
    {
        $arg
    }
}
Get-Args 1 2 3 4 5 8 9 3 7

#Get-Parameters
function Show-Parameters($name, $number)
{
    "Name = $name, Number = $number"
}

#Show-Parameters '1' 'Wiki'
Show-Parameters -number '1' -name 'Wiki'

#Function Scope
function Show-FunctionScope()
{
    $x = 1
    "function x = $x"
}

$x = 0
Show-FunctionScope
"script x = $x"

function Show-ScriptScope()
{
    $x = 1
    "function x = $x"
    $script:x = 2
}

$x = 0
Show-ScriptScope
"script x = $x"


# The Get-Factorial function returns the factorial of the value provided using recursion.
#1 - 1, 2 - 1*2, 3 - 1*2*3,
function Get-Factorial([int]$value)
{
    if($value -lt 0)
    {
        $result = 0
    }
    elseif($value -le 1)
    {
        $result = 1
    }
    else
    {
        $result = $value * (Get-Factorial($value - 1))
    }

    return $result
}

$value = Read-Host 'Enter a value'
$result = Get-Factorial $value
Write-Output "$value! = $result"


#Data Type Validation
function Get-Square()
{
    Param
    (
        [double]$value
    )
    return $value * $value   
}

Get-Square 2.2


#Mandatory Validation
function Get-Square()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [double]$value
    )
    return $value * $value   
}


Get-Square 


#Not Null or Empty Validation
function Get-Posessive()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$value
    )
    if($value.Substring($value.Length - 1, 1) -eq 'a')
    {
        $result = $value + ''''
    }
    else
    {
        $result = $value + '''s'
    }
    return $result
}

Get-Posessive ss


#Script Validation
function Get-Reciprocal()
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateScript({$_ -ne 0})]
        [double]$value
    )
    return 1 / $value   
}

Get-Reciprocal 0