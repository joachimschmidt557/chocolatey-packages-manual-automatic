$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.8.1/VNote_win_x86_portable_2.8.1.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.8.1/VNote_win_X64_portable_2.8.1.zip'
$checksum32 = '6dac300c90ba8c28f5c571f2aa5b407446c481bb454400cbffa0c280e9c2f9c0'
$checksum64 = 'd583fa234cfa3970c6953694fbcbca8edd4a7f549b7242f50d404d67d2a89a73'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
