

$compress = @{
  Path = "G:\PS-Test\Dir"
  CompressionLevel = "Fastest"
  DestinationPath = "G:\PS-Test\DIR.Zip"
}
Compress-Archive @compress

Compress-Archive -Path "G:\PS-Test\Dir\*" -DestinationPath "G:\PS-Test\DIR.Zip"

Get-ChildItem -Path "G:\PS-Test\Dir" | Compress-Archive -DestinationPath "G:\PS-Test\DIR.Zip"


Compress-Archive -Path G:\PS-Test\Existing-Directory\*.* -DestinationPath G:\PS-Test\ED_File.Zip

Get-ChildItem -Path G:\PS-Test\Existing-Directory -Recurse |
Compress-Archive -DestinationPath G:\PS-Test\ED.Zip


Compress-Archive -Path G:\PS-Test\Dir -Update -DestinationPath "G:\PS-Test\DIR.Zip"