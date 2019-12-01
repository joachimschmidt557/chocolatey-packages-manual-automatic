$packageName = 'vnote.portable'
$url32      = 'https://github.com/tamlok/vnote/releases/download/v2.8/VNote_win_x86_portable_2.8.zip'
$url64      = 'https://github.com/tamlok/vnote/releases/download/v2.8/VNote_win_X64_portable_2.8.zip'
$checksum32 = '14141ac9ca12d60983e97f496fec00db430375aca8d371d6c8a1da26bf3d2bda'
$checksum64 = '688c09af1a908c6276cc4d99f236d860f6a741bc03e96b93c9b7f90901e41fb7'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
