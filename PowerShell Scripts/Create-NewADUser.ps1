 #Import the Active Directory Module
 Import-Module activedirectory 

 #Import the list from the user
 $Users = Import-Csv -Path C:\Userlist.csv   

 $OU= ''

 foreach ($User in $Users)            
 {   

  $Office         
  $Displayname =  $User.Lastname + ", " +  $User.Firstname            
  $UserFirstname = $User.Firstname
  $UserLastname = $User.Lastname            
  $SAM = $user.samAccountName       
  $UPN = $UserFirstname + $UserLastname + "@swe.local"           
  $Description = $User.Description            
  $Password = $User.Password
  
  try {
  Write-Host Creating User: $Displayname
  #Creation of the account with the requested formatting.
  New-ADUser -Name "$Displayname" `
       -DisplayName "$Displayname" `
       -SamAccountName $SAM `
       -Office "Office" `
       -UserPrincipalName $UPN ` 
       -GivenName "$UserFirstname" `
       -Surname "$UserLastname" ` 
       -Description "$Description" `
       -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) ` 
       -Enabled $true `
	   -Path "$OU" `
       -ChangePasswordAtLogon $True `
       –PasswordNeverExpires $false
       
  $property = @{samAccount=$user.samAccountName;Message='CreatedSuccessfully'} 
  
  catch{
  $errormessage = $_.exception.message
  $property = @{samAccount=$user.samAccountName;Message=$errormessage} 
 }
  $AllObjects += New-Object PSobject -Property $property  
 }

  $AllObjects | export-csv c:\Output.csv -NoTypeInformation 
 }

      
 }