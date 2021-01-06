 #Import the Active Directory Module
 Import-Module activedirectory 

 #Import the list from the user
 $Users = Import-Csv -Path C:\Userlist.csv
 
 $AllObjects=@() 
 foreach ($User in $Users)            
 { 
 try {
 
	$UpdatedUPN = $User.SamAccountName + "@something.com" 
	Set-ADUser $User.samAccountName -UserPrincipalName $UpdatedUPN 
	
	$property = @{samAccount=$User.samAccountName;UPN=$UpdatedUPN;ErrorMessage='UpdatedSuccessfully'}	
 }
 catch{
    $errormessage = $_.exception.message
    $property = @{samAccount=$User.samAccountName;UPN=$UpdatedUPN;ErrorMessage=$errormessage}
 }

    $AllObjects += New-Object PSobject -Property $property
 }

 $AllObjects | export-csv c:\Output.csv -NoTypeInformation