Get-Alias |
  ConvertTo-Html Name,
                 Definition |
    Out-File .\aliases.html -Force