$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.10.1-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.6-win-x86.zip'
$checksum32 = 'cf84ee4dff8c77d22249c3fd6addc8c206f948d137e520954932b098fd1d8561'
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
