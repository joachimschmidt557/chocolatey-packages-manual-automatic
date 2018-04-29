$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v1.15/VNote_win_x86_portable_1.15.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v1.15/VNote_win_X64_portable_1.15.zip'
$checksum32 = 'b35da0cc20e11791ae7fa8ecbd4e6eb2f8e893552e8af7052549d8245e788cb5'
$checksum64 = 'ee7b2842329a3cb830e5acda94eb3283c9bee0b66fa660e90c8b48561b99ecc8'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
