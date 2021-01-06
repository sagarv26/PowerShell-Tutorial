$PCs = Get-Content -path "G:\PS-Test\File1.txt"

$AllObjects=@()
foreach($pc in $pcs)
{
try {
      $server=$pc
    
      $time= Get-WmiObject -Class win32_timezone -ComputerName $server | select  caption
      Write-Host Server: $server - TimeZone $time.caption  
      $property = @{PC=$server;Time=$time.caption;ErrorMessage='UpdatedSuccessfully'}
}

catch {
      $errormessage = $_.exception.message
      $property = @{PC=$server;Time='';ErrorMessage=$errormessage}
}

$AllObjects += New-Object PSobject -Property $property
}

$AllObjects | export-csv "G:\PS-Test\OutPut.csv" -NoTypeInformation