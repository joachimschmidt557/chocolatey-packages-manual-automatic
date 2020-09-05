$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.10/VNote_win_x86_portable_2.10.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.10/VNote_win_X64_portable_2.10.zip'
$checksum32 = 'b3474dfda636cffedef0ff3aeb268d33e6ebf8256cec38418b8d1e0088976a16'
$checksum64 = '99f67a2e0e35c21a68d2d2e0caa8314f57720571b9d106684e790b1b1373caee'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
