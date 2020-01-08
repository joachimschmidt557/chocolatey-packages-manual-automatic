$packageName = 'fmedia'
$url32      = 'https://github.com/stsaz/fmedia/releases/download/v1.14/fmedia-1.14-win-x64.zip'
$url64      = 'https://github.com/stsaz/fmedia/releases/download/v1.6/fmedia-1.6-win-x86.zip'
$checksum32 = '1824dc1fa6c56c830133ee7bf39998e9503018c025fc05b4ed6f0fcae20cb2d7'
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
