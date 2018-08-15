$packageName = 'shotcut.portable'
$url32      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.14/shotcut-win32-180814.zip'
$url64      = 'https://github.com/mltframework/shotcut/releases/download/v18.08.14/shotcut-win64-180814.zip'
$checksum32 = 'e85e66ab1976105dda281bfc54ab38e3d8da75d3c006a844c0aea87eb85d559b'
$checksum64 = '24927866e7803b4f0bcee5a5fa664c97ca703997ca9021ad47a98afaa8d73bc0'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url32" `
                             -Url64Bit "$url64" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum32" `
                             -ChecksumType "sha256" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "sha256" `
