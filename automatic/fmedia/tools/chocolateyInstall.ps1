$packageName = 'fmedia'
$url32      = 'http://fmedia.firmdev.com/fmedia-0.37-win-x64.zip'
$url64      = 'http://fmedia.firmdev.com/fmedia-0.37-win-x86.zip'
$checksum32 = '60b63528ffe9e5764423256bb39516febee203fa8c66481bf9242cfeff1ced40'
$checksum64 = 'db99d1499ed577661464dc54eb3392991c8f8ee0b23575ae4dc7b83d18549ea0'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
