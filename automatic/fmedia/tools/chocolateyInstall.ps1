$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.8-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.6-win-x86.zip'
$checksum32 = 'f3925f78c79e0794ab5f308ecdcfee94a0981c535f4c202f73cf7d56b748762a'
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
