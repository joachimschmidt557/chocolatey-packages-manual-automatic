$packageName = 'vnote.portable'
$url32      = 'https://github.com/vnotex/vnote/releases/download/v3.12.888/vnote-win-x86_v3.12.888.zip'
$url64      = 'https://github.com/vnotex/vnote/releases/download/v3.12.888/vnote-win-x64_v3.12.888.zip'
$checksum32 = '7776590bd37ef3eeee77ffcd67ece2da33236ef209c9e8db1527bb9b51f92b5d'
$checksum64 = '4792e51333ebbd011701309d291870884bb5fe93f92449ba1abff7b76c18ce43'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
