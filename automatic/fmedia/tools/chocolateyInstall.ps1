$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-1.9-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-1.6-win-x86.zip'
$checksum32 = '9169cbc33df27bf98c037bb3406c086313498da62dd5f6e58a2a7fccae2b06b7'
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
