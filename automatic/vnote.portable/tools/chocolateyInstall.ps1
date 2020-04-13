$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.9.1/VNote_win_x86_portable_2.9.1.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.9.1/VNote_win_X64_portable_2.9.1.zip'
$checksum32 = '45a17d0b540e262551bca4132d722b7f19eb4b60361c44fe12c8858614322289'
$checksum64 = 'c96474fd1bbc2fddc2c56b786d7843f96c3a677b18af354ed5474b74991b08db'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
