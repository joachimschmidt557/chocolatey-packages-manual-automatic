$packageName = 'fmedia'
$url32      = 'https://github.com/stsaz/fmedia/releases/download/v1.11/fmedia-1.11-win-x64.zip'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.6/fmedia-1.6-win-x86.zip'
$checksum32 = '071a7e89298e3f4d03ffd4c27834fd4ab4a96f494ee5c8ea5a8f056c199fa05e'
$checksum64 = 'bf7f0d7c9a9c38c1ebf2c4a49c36656e80cb5b433de5b36d12692c985b62bf42'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
