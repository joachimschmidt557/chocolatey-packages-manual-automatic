$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.1/VNote_win_x86_portable_2.1.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.1/VNote_win_X64_portable_2.1.zip'
$checksum32 = 'e25ec447766c68b209334841b9e40220a5017afd4f898f8a5f98ebfc5c00e7ee'
$checksum64 = 'adba1aca98ad1ac3a5458fde997d9715ba59fab27d3c2bc648138d4debd4f372'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
