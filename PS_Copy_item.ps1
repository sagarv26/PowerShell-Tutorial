
Copy-Item "G:\PS-Test\Date.htm" -Destination "G:\PS-Test\Dir\"

Copy-Item -Path "G:\PS-Test\Dir\*" -Destination "G:\PS-Test\Existing-Directory" -Recurse

Copy-Item -Path "G:\PS-Test\Dir" -Destination "G:\PS-Test\Model-Directory" -Recurse

Copy-Item "G:\PS-Test\Date.htm" -Destination "G:\PS-Test\Dir\Date-New.htm"; Get-ChildItem "G:\PS-Test\Dir\"

#Copy a file\folder to a remote computer
$Session = New-PSSession -ComputerName "Server01" -Credential "Contoso\User01"
#To Session 
Copy-Item "D:\Folder001\test.log" -Destination "C:\Folder001_Copy\" -ToSession $Session
Copy-Item "D:\Folder002\" -Destination "C:\Folder002_Copy\" -ToSession $Session
#From Session
Copy-Item "C:\MyRemoteData\test.log" -Destination "D:\MyLocalData\" -FromSession $Session