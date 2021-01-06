  
 #Import the Active Directory Module
 Import-Module activedirectory 
 
 #Get Content from CSV
 $groups=Import-Csv 'C:\Input.csv' 

 $Object=@()
 foreach($group in $groups){

  try{

  #Creating Group
  New-ADGroup $group.name -Path "ou=TestOU,DC=test,DC=com" -GroupScope Global -GroupCategory Security

  $users = ($group.members).split(",")
  foreach($user in $users){
	  #AddingMember
	  Add-ADGroupMember $group.name -Members $user
  }
  
  $Property=@{
  Group=$group.name;
  Status='created'
  }
  }

  catch{

  $errormessage = $_.exception.message
  
  $Property=@{
  Group=$group.name;
  Status=$errormessage
  }
  
  }

  $Object+=New-Object PSObject -Property $Property

    

 }

 $Object | export-csv c:\output.csv -NoTypeInformation