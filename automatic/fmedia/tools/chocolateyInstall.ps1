$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-0.34.1-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-0.34.1-win-x86.zip'
$checksum32 = ''
$checksum64 = ''
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
