$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-0.35-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-0.35-win-x86.zip'
$checksum32 = 'aafb35579388a698cbd71527c3e7416c1d17ad902b6dc0988ca37327fe709c59'
$checksum64 = '669fe74806c26dc88fb5ef6ae1837db556ad62e94bc0777bd3ff2a15ca904aae'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
