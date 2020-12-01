
#While Loop
$i = 0
while($i -lt 3)
{
    Write-Output $i
    $i++
}

#Do While Loop
$i = 5
do
{
    Write-Output $i
    $i++
}while($i -lt 3)

#Do Until
$i = 0
do
{
    Write-Output $i
    $i+
}until($i -gt 3)


#for
for($i = 10; $i -ge 1; $i--)
{
    Write-Output $i
}

#for
for(; ;)
{
    Write-Output $i
}

#Nested For
for($i = 0; $i -lt 3; $i++)
{
    $line = ''
    for($j = 0; $j -lt 3; $j++)
    {
        $line += $i.ToString() + $j.ToString() + ' '
    }
    Write-Output $line
}

#For Each
$processes = Get-Process
foreach($process in $processes)
{
    if($process.PM / 1024 / 1024 -gt 100)
    {
        Write-Output ('Process ' + $process.Name + ' is using more than 100 MB RAM.')
    }
}

#Continue
$processes = Get-Process
foreach($process in $processes)
{
    if($process.PM / 1024 / 1024 -le 100)
    {
        continue
    }
    Write-Output ('Process ' + $process.Name + ' is using more than 100 MB RAM. '+ $process.PM)
}

#Break
$processes = Get-Process
foreach($process in $processes)
{
    if($process.PM / 1024 / 1024 -gt 100)
    {
        Write-Output ('Process ' + $process.Name + ' is using more than 100 MB RAM.')
        break
    }
}


#ForEach Object
Get-Process | ForEach-Object { if($_.PM / 1024 / 1024 -gt 100) {'Process ' + $_.Name + ' is using more than 100 MB RAM.'} }
