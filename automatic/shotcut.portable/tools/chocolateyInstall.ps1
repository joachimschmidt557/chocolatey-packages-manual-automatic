$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.31/shotcut-win32-191231.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v19.12.31/shotcut-win64-191231.zip'
$checksum32 = '55257bf23aba1687c47d104dda10ebb799e0f068027277f7f7ef2399c8b5f316'
$checksum64 = 'ccdff18537d46cdd177d5df82d7b5cf8bbb6cdbcf390e44fec84717fbc997b70'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
