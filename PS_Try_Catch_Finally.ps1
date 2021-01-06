
#The following sample script shows a Try block with a Catch block:
try { NonsenseString }
catch { "An error occurred.`n`nError in catch block" }

#the following script has a Try block that downloads MyDoc.doc, and it contains two Catch blocks
try {
NonsenseString 
   $wc = new-object System.Net.WebClient
   $wc.DownloadFile("http://www.contoso.com/MyDoc.doc","c:\temp\MyDoc.doc")
}
catch [System.Net.WebException],[System.IO.IOException] {
    "Unable to download MyDoc.doc from http://www.contoso.com."
}
catch {
    "An error occurred that could not be resolved."
}

#ACCESSING EXCEPTION INFORMATION
try { NonsenseString }
catch {
  Write-Host "An error occurred:"
  Write-Host $_
}