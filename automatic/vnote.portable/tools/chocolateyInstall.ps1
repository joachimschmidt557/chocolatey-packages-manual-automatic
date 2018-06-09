$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.18/VNote_win_x86_portable_1.18.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.18/VNote_win_X64_portable_1.18.zip'
$checksum32 = '56c887375fff3c290b512cbcb21d7ca99cccea74c21c4ae2befbd37ca731466e'
$checksum64 = '01f8249d86fa1b0466e4eacd4d64bca63c6264c49a6fee275c50b86f77524adb'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
