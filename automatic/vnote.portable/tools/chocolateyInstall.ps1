$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.7.2/VNote_win_x86_portable_2.7.2.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.7.2/VNote_win_X64_portable_2.7.2.zip'
$checksum32 = 'e2c30a521f8e2f791d4ff2c479981ac32365c7f76fa3852ec0a5e105b1d26210'
$checksum64 = 'd508436aa8003acdef3a3e2bcd84732c333199525a4d4d23e15468bf3a8c8ad0'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
