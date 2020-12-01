

#if statement
$input = Read-Host 'Is it Morning (M), Afternoon (A), or Evening (E)? '
if($input -eq 'm')
{
    Write-Output 'Good morning!'
}
elseif($input -eq 'a')
{
    Write-Output 'Good afternoon!'
}
elseif($input -eq 'e')
{
    Write-Output 'Good evening!'
}
else
{
    Write-Output 'Hello!'
}


#switch statement
$input = Read-Host 'Is it Morning (M), Afternoon (A), or Evening (E)? '
switch($input)
{
    m {'Good morning!'}
    a {'Good afternoon!'}
    e {'Good evening!'}
    default {'Hello!'}
}

#match operator
$input = Read-Host 'Enter zip code'
if(!($input -match '^\d{5}-\d{4}'))
{
    Write-Output "$input is not a valid zip code."
}


#Switch -Regex
$input = Read-Host 'Enter something'
switch -Regex ($input)
{
    '.'   {'You entered a character'}
    '\d'  {'You entered a digit'}
    '\s'  {'You entered a space'}
    '\w'  {'You entered a word'}
    '\w \w' {'You entered multiple words'}
    default {'You entered nothing'}
}

#Break Statement
$input = Read-Host 'Enter something'
switch -Regex ($input)
{
    '^.$'
    {
        'You entered a character'
        break
    }

    '^\d$'
    {
        'You entered a digit'
        break
    }

    '^\s$'
    {
        'You entered a space'
        break
    }

    '\w \w'
    {
        'You entered multiple words'
        break
    }

    '\w'
    {
        'You entered a word'
        break
    }

    default
    {
        'You entered nothing'
    }
}

#Where-Object
Get-Process | Where-Object {($_.Name -eq "iexplore") -or ($_.Name -eq "chrome") -or ($_.Name -eq "firefox")}

Get-Process | ? {($_.Name -eq "iexplore") -or ($_.Name -eq "chrome") -or ($_.Name -eq "firefox")}

