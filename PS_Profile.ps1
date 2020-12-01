
#To see the current values of the $PROFILE variable
$PROFILE | Get-Member -Type NoteProperty

#Command which opens the "Current User, Current Host" profile in Notepad
notepad $PROFILE

#The following command determines whether an "Current User, Current Host" profile has been created on the local computer
Test-Path -Path $PROFILE

#To create a PowerShell profile
if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType File -Path $PROFILE -Force
}