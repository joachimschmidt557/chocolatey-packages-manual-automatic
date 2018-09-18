$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.16/shotcut-win32-180916.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.09.16/shotcut-win64-180916.zip'
$checksum32 = 'e42bb3e7d2d86fc6f6e7a66baeed7727a00b54924af5d9de0bc3a047aaf4342f'
$checksum64 = '1d4f346041d479ceaad93819eb25984026fbc5e7c0823653a556021899912eb4'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
