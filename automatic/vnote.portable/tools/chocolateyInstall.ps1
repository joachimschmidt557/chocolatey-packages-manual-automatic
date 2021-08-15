$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.6.0/vnote-win-x86_v3.6.0.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.6.0/vnote-win-x64_v3.6.0.zip'
$checksum32 = 'dec35119cbb1596c83299875729eb247765d3953da95d76c1cf91a2ac5c7c7b8'
$checksum64 = 'b18f88e76685ac6faa9c93dfb8a7e28000879ef0dbc6e3c7ac48ff0282a43c60'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
