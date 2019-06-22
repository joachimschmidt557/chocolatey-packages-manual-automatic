$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.7/VNote_win_x86_portable_2.7.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.7/VNote_win_X64_portable_2.7.zip'
$checksum32 = 'd6eb7044e7abf6f5c768ad0eef59604c646b46ad1a16ff585e5c3b472d3792b7'
$checksum64 = '627ad5477874ec0759ac4db232bd95025b410711118687191e311b983eec9fc7'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
