 
$path = ''
$users = import-csv $path

#Standard values
$Company       = 'SWE'
$OU= ' '
$DC= ' ' 

ForEach ($user in $users) {

$SecuredPassword = 'xxiff44#'
$DisplayName = $user.DisplayName 
$GivenName = $user.GivenName 
$samaccountname = $user.samAccountName 
$LastName = $user.LastName 
$Name = $user.Name 

$AllObjects=@()

#create the user
try{
New-ADUser  -AccountPassword:$SecurePassword `
			-ChangePasswordAtLogon:$false `
			-Company:$Company `
			-DisplayName:$DisplayName `        
			-Enabled:$true `
			-GivenName:$GivenName `
			-Name:$Name `
			-Path:$OU `
			-SamAccountName:$samaccountname `
			-Server:$DC `
			-Surname:$LastName `
			-EA Stop
			
$property = @{samAccount=$user.samAccountName;Message='CreatedSuccessfully'}		
}
catch{
$errormessage = $_.exception.message
$property = @{samAccount=$user.samAccountName;Message=$errormessage}	
}
$AllObjects += New-Object PSobject -Property $property		
}

$AllObjects | export-csv c:\Output.csv -NoTypeInformation

