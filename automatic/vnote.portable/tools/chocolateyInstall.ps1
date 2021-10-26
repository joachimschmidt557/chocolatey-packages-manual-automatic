$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.8.1/vnote-win-x86_v3.8.1.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.8.1/vnote-win-x64_v3.8.1.zip'
$checksum32 = 'f36ffab13822d5b0471b24e1cbaa8d73835024df58cfadb91f5eda0d846bdeaa'
$checksum64 = 'a9d179c606f1aea9fdc95691cf994c9a3732fa5604efc4ac7aea8de81b11b5f8'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
